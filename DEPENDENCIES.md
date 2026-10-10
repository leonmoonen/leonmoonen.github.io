# Dependencies

This file records changes to third-party code that differ from the upstream [Feeling Responsive](https://github.com/Phlow/feeling-responsive) theme, why they were made, and what to watch for.

- [Ruby: the Gemfile does not use `github-pages`](#ruby-the-gemfile-does-not-use-github-pages)
- [JavaScript: jQuery 3.7.1 in the theme bundle](#javascript-jquery-371-in-the-theme-bundle)

## Ruby: the Gemfile does not use `github-pages`

- **Date**: 2026-10-09
- **Alert**: [Dependabot #28](https://github.com/leonmoonen/leonmoonen.github.io/security/dependabot/28), `rubyzip` path traversal, [GHSA-47m2-wp7j-p9vc](https://github.com/advisories/GHSA-47m2-wp7j-p9vc), severity high
- **Affected files**: `Gemfile`, `Gemfile.lock`

### The issue

`Gemfile.lock` contained `rubyzip` 2.4.1. Versions before 3.4.0 have a path traversal vulnerability: a crafted zip archive can write files outside the target directory when it is extracted.

The gem came in through this chain:

```
github-pages (232)
└── jekyll-remote-theme (= 0.4.3)
    └── rubyzip (>= 1.3.0, < 3.0)
```

`github-pages` 232 is the newest release, and it pins `jekyll-remote-theme` to exactly 0.4.3. That version does not accept `rubyzip` 3.x. So it is not possible to update `rubyzip` to 3.4.0 while the `Gemfile` depends on `github-pages`.

#### Actual risk

The risk to this site was low:

- Only `jekyll-remote-theme` uses `rubyzip`, to unpack a theme downloaded from GitHub. This site does not use a remote theme. Its theme is in `_layouts`, `_includes` and `_sass`.
- The site is deployed by the GitHub Pages **legacy build** (branch `master`, path `/`). That build uses GitHub's own `github-pages` environment and ignores `Gemfile` and `Gemfile.lock`. These two files only control local previews (`make`).

### The solution

The `Gemfile` no longer depends on the `github-pages` gem. It lists only what the site needs to build locally:

- `jekyll` 3.10.0, the same version that `github-pages` 232 uses;
- `kramdown-parser-gfm`, which Jekyll needs for GitHub-flavored Markdown;
- `webrick`, which `jekyll serve` needs on Ruby 3;
- in the `:jekyll_plugins` group, the plugins that GitHub Pages always enables, so a local build behaves like the GitHub build: `jekyll-coffeescript`, `jekyll-default-layout`, `jekyll-gist`, `jekyll-github-metadata`, `jekyll-optional-front-matter`, `jekyll-paginate`, `jekyll-readme-index`, `jekyll-relative-links`, `jekyll-titles-from-headings`.

The new `Gemfile.lock` does not contain `rubyzip`.

#### Verification

The site was built twice into separate directories, first with the old bundle and then with the new bundle, and the two outputs were compared with `diff -rq`. All files were identical, except for the build timestamps in the `<lastmod>` fields of `sitemap.xml`.

### The trade-off

Before this change, the `github-pages` gem kept the local environment equal to the one GitHub uses. Now the local environment is maintained by hand. A local preview can differ from the published site when:

1. GitHub updates its Pages environment, for example to a new Jekyll version or a new default plugin; or
2. the site starts to use a plugin that is in `github-pages` but not in this `Gemfile`, such as `jekyll-feed`, `jekyll-sitemap` or `jekyll-seo-tag`. The site builds without errors on GitHub but not locally, or the reverse.

The published site is not affected by either case, because GitHub does not read this `Gemfile`.

### How to fix the trade-off

**When you add a plugin** to `plugins:` in `_config.yml`, also add it to the `:jekyll_plugins` group in the `Gemfile`, then run `bundle install`. Use the version listed at <https://pages.github.com/versions/>, because GitHub Pages only supports the plugins and versions listed there.

**When GitHub updates its environment**, compare the `jekyll` version at <https://pages.github.com/versions/> with the version pinned in the `Gemfile`. If they differ, change the pin and run `bundle update jekyll`.

**To return to the old setup**, replace the contents of the `Gemfile` with this line and run `bundle update`:

```ruby
gem 'github-pages', '>= 232'
```

Do this when a new `github-pages` release accepts `rubyzip` 3.4.0 or later. To check, look at the dependencies of `jekyll-remote-theme` in the `github-pages` release on <https://rubygems.org/gems/github-pages>. Until then, going back will bring the Dependabot alert back.

## JavaScript: jQuery 3.7.1 in the theme bundle

- **Date**: 2026-10-10
- **Affected files**: `assets/js/javascript.js`, `assets/js/javascript.min.js`

### The issue

The theme loads one script bundle on every page, `assets/js/javascript.min.js`. It contained jQuery 2.1.1 (May 2014), which has known security vulnerabilities, among them [CVE-2015-9251](https://nvd.nist.gov/vuln/detail/CVE-2015-9251), [CVE-2019-11358](https://nvd.nist.gov/vuln/detail/CVE-2019-11358), [CVE-2020-11022](https://nvd.nist.gov/vuln/detail/CVE-2020-11022) and [CVE-2020-11023](https://nvd.nist.gov/vuln/detail/CVE-2020-11023). Upstream Feeling Responsive still ships the same jQuery 2.1.1 in its bundle, so merging upstream does not fix this.

The bundle contains, in this order: jQuery, FastClick 1.0.3, Foundation 5.5.0 (core, accordion, clearing, dropdown, equalizer, magellan, reveal, topbar), Backstretch 2.0.4, and the call that starts Foundation.

### The solution

jQuery in the bundle is replaced by **jQuery 3.7.1**, the last 3.x release. It has no known vulnerabilities. The file was taken from the npm package `jquery@3.7.1` and is byte-identical to <https://code.jquery.com/jquery-3.7.1.min.js>.

jQuery 3.0 removed the `.load(handler)` and `.error(handler)` event shortcuts, and the `.selector` property of jQuery objects. Foundation 5.5.0 depended on them in four places, so these lines in `javascript.js` were changed:

| Module | Before | After |
|---|---|---|
| Foundation core | `S(window).load(function(){` | `S(window).on('load', function(){` |
| clearing | `image.error(function () {` | `image.on('error', function () {` |
| topbar | `.trigger('resize.fndtn.topbar').load(function(){` | `.trigger('resize.fndtn.topbar').on('load', function(){` |
| reveal | `if (typeof target.selector !== 'undefined') {` | `if (typeof target.jquery !== 'undefined') {` |

Without the first change, Foundation fails to start on jQuery 3 and the navigation menus stop working. The reveal test separates a clicked link (a jQuery object) from AJAX settings (a plain object). On jQuery 3, `.selector` is always undefined, so a modal opened from a link would be treated as an AJAX request and would not open. Every jQuery object has a `.jquery` property, so the new test gives the same result as the old test did on jQuery 2. Apart from jQuery and these four lines, `javascript.js` is unchanged.

`javascript.min.js` is generated from `javascript.js`:

```sh
npx terser@5 assets/js/javascript.js -c -m --comments '/^!|@preserve|@license/' -o assets/js/javascript.min.js
```

**Why not jQuery 4.0.** Foundation 5.5.0 calls `$.isArray`, `$.isFunction` and `$.trim`, which jQuery 4.0 removed. Version 4 would need more patches to Foundation, and 3.7.1 already fixes the known vulnerabilities.

### Verification

The site was built twice, with the old bundle and with the new bundle, and each page (`/`, `/affiliation/`, `/about/`, `/research/`, `/research/news/`, `/publications/`, `/schedule/`, `/contact/`, `/search/`) was loaded in headless Chrome at desktop width (1280 px) and phone width (390 px). For both bundles, on every page:

- Foundation started and the top bar initialized;
- on desktop, the Research dropdown opened on hover;
- on phone width, the menu opened when the menu button was tapped;
- the Backstretch header photo loaded;
- no JavaScript errors came from the bundle.

Full-page screenshots of the old and new bundle showed zero differing pixels (pixelmatch, threshold 0.1). The only difference measured was the jQuery version.

No page uses the reveal module, so it was tested separately: a modal and a link with `data-reveal-id` were added to `/research/` in the browser. With both bundles, the modal opened on a click and closed with its close button, without errors.

### What to watch for

- **Untested Foundation modules.** No page uses accordion, clearing, dropdown, equalizer or magellan, so these were not tested in a browser. The clearing module also reads `.selector` (`/blackout/.test(target.selector)`), but this was not changed: on jQuery 2 the property was an empty string for the element it receives, so the test was already false, and the fallback `target.closest('.clearing-blackout')` also finds the element itself. If you start to use one of these modules, test it first.
- **Editing the bundle.** Edit `javascript.js`, then regenerate `javascript.min.js` with the command above. The site loads only the minified file.
- **To undo**, restore both files from the commit before this change: `git checkout <commit>^ -- assets/js/javascript.js assets/js/javascript.min.js`.
