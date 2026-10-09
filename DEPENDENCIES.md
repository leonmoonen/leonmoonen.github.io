# Ruby dependencies: why the Gemfile does not use `github-pages`

- **Date**: 2026-10-09
- **Alert**: [Dependabot #28](https://github.com/leonmoonen/leonmoonen.github.io/security/dependabot/28), `rubyzip` path traversal, [GHSA-47m2-wp7j-p9vc](https://github.com/advisories/GHSA-47m2-wp7j-p9vc), severity high
- **Affected files**: `Gemfile`, `Gemfile.lock`

## The issue

`Gemfile.lock` contained `rubyzip` 2.4.1. Versions before 3.4.0 have a path traversal vulnerability: a crafted zip archive can write files outside the target directory when it is extracted.

The gem came in through this chain:

```
github-pages (232)
└── jekyll-remote-theme (= 0.4.3)
    └── rubyzip (>= 1.3.0, < 3.0)
```

`github-pages` 232 is the newest release, and it pins `jekyll-remote-theme` to exactly 0.4.3. That version does not accept `rubyzip` 3.x. So it is not possible to update `rubyzip` to 3.4.0 while the `Gemfile` depends on `github-pages`.

### Actual risk

The risk to this site was low:

- Only `jekyll-remote-theme` uses `rubyzip`, to unpack a theme downloaded from GitHub. This site does not use a remote theme. Its theme is in `_layouts`, `_includes` and `_sass`.
- The site is deployed by the GitHub Pages **legacy build** (branch `master`, path `/`). That build uses GitHub's own `github-pages` environment and ignores `Gemfile` and `Gemfile.lock`. These two files only control local previews (`make`).

## The solution

The `Gemfile` no longer depends on the `github-pages` gem. It lists only what the site needs to build locally:

- `jekyll` 3.10.0, the same version that `github-pages` 232 uses;
- `kramdown-parser-gfm`, which Jekyll needs for GitHub-flavored Markdown;
- `webrick`, which `jekyll serve` needs on Ruby 3;
- in the `:jekyll_plugins` group, the plugins that GitHub Pages always enables, so a local build behaves like the GitHub build: `jekyll-coffeescript`, `jekyll-default-layout`, `jekyll-gist`, `jekyll-github-metadata`, `jekyll-optional-front-matter`, `jekyll-paginate`, `jekyll-readme-index`, `jekyll-relative-links`, `jekyll-titles-from-headings`.

The new `Gemfile.lock` does not contain `rubyzip`.

### Verification

The site was built twice into separate directories, first with the old bundle and then with the new bundle, and the two outputs were compared with `diff -rq`. All files were identical, except for the build timestamps in the `<lastmod>` fields of `sitemap.xml`.

## The trade-off

Before this change, the `github-pages` gem kept the local environment equal to the one GitHub uses. Now the local environment is maintained by hand. A local preview can differ from the published site when:

1. GitHub updates its Pages environment, for example to a new Jekyll version or a new default plugin; or
2. the site starts to use a plugin that is in `github-pages` but not in this `Gemfile`, such as `jekyll-feed`, `jekyll-sitemap` or `jekyll-seo-tag`. The site builds without errors on GitHub but not locally, or the reverse.

The published site is not affected by either case, because GitHub does not read this `Gemfile`.

## How to fix the trade-off

**When you add a plugin** to `plugins:` in `_config.yml`, also add it to the `:jekyll_plugins` group in the `Gemfile`, then run `bundle install`. Use the version listed at <https://pages.github.com/versions/>, because GitHub Pages only supports the plugins and versions listed there.

**When GitHub updates its environment**, compare the `jekyll` version at <https://pages.github.com/versions/> with the version pinned in the `Gemfile`. If they differ, change the pin and run `bundle update jekyll`.

**To return to the old setup**, replace the contents of the `Gemfile` with this line and run `bundle update`:

```ruby
gem 'github-pages', '>= 232'
```

Do this when a new `github-pages` release accepts `rubyzip` 3.4.0 or later. To check, look at the dependencies of `jekyll-remote-theme` in the `github-pages` release on <https://rubygems.org/gems/github-pages>. Until then, going back will bring the Dependabot alert back.
