# Snippety

[![Dependency Status](https://img.shields.io/gemnasium/tabolario/snippety.svg?style=flat)][dependency-status]
[![Build Status](https://img.shields.io/travis/tabolario/snippety.svg?style=flat)][build-status]
[![Code Climate](https://img.shields.io/codeclimate/github/tabolario/snippety.svg?style=flat)][code-climate]
[![Coverage Status](https://img.shields.io/coveralls/tabolario/snippety.svg?style=flat)][coverage-status]
[![Inline docs](http://inch-ci.org/github/tabolario/snippety.svg?branch=master&style=flat)][inline-docs]

[dependency-status]: https://gemnasium.com/tabolario/snippety
[build-status]: https://travis-ci.org/tabolario/snippety
[code-climate]: https://codeclimate.com/github/tabolario/snippety
[coverage-status]: https://coveralls.io/r/tabolario/snippety?branch=master
[inline-docs]: http://inch-ci.org/github/tabolario/snippety

**Warning: This application is currently in its initial iteration and may not yet function as shown here in the readme.**

A private pastebin for individuals and teams.

## Requirements

* Linux or OS X (Windows is **not** supported)
* Ruby 2.2+
* PostgreSQL 9.3+

## Deployment

**TODO: Put installation instructions here.**

## Getting started

**TODO: Put getting started instructions here.**

## Configuration

**TODO: Put configuration instructions here.**

## Documentation

Full online help for Snippety is available in each installation at `/help`.

See the [YARD documentation](http://rdoc.info/github/tabolario/snippety/frames) for the latest RDoc documentation.

Generate local documentation with YARD (output to the `doc` directory):

    $ bin/rake yard

## Support

* [![Gitter chat](https://badges.gitter.im/tabolario/snippety.png)](https://gitter.im/tabolario/snippety)
* [GitHub Issues](https://github.com/tabolario/snippety/issues)
* Email: [tony@tabolario.com](mailto:tony@tabolario.com)
* Twitter: [@tabolario](https://twitter.com/tabolario)

## Development and testing

### Requirements

* Linux or Mac OS X (development on Windows is *not* supported)
* Runtime requirements as detailed above
* [PhantomJS][phantomjs] (install for your platform by following the instructions at [phantomjs.org][phantomjs-install])

[phantomjs]: http://phantomjs.org/
[phantomjs-install]: http://phantomjs.org/download.html

### Setup

The easiest way to set up a local development environment for Snippety is via:

    $ bin/setup

If you ever need to reset your development environment, run:

    $ RESET=1 bin/setup

### Testing

Run all tests:

    $ bin/rake spec

Run all unit tests:

    $ bin/rake spec:unit

Run all acceptance tests:

    $ bin/rake spec:features

Run all JavaScript tests:

    $ bin/rake spec:javascripts

### Code style

Coding conventions for Ruby, JavaScript, and SCSS are enforced via a number of linting tools, as described below. All of the linters can be
run at once via:

    $ bin/rake lint

#### Ruby

Snippety follows the [Ruby Style Guide][ruby-style-guide] for Ruby coding conventions and uses [RuboCop][rubocop] to enforce them. The
configuration for RuboCop can be found in [.rubocop.yml][rubocop-yml]. The Ruby linter can be run by itself via:

    $ bin/rake lint:ruby

Inline documentation for Ruby code is also analyzed by [inch][inch] in order to find areas to improve on. The inline documentation linter
can be run by itself via:

    $ bin/rake lint:docs

[rubocop]: https://github.com/bbatsov/rubocop
[ruby-style-guide]: https://github.com/bbatsov/ruby-style-guide
[rubocop-yml]: https://github.com/tabolario/snippety/blob/master/.rubocop.yml
[inch]: http://trivelop.de/inch/

#### JavaScript

[jshint][jshint] is used to enforce JavaScript coding conventions. The configuration for JSHint can be found in the
[rake task][jshint-task]. The JavaScript linter can be run by itself via:

    $ bin/rake lint:javascripts

[jshint]: http://jshint.com/
[jshint-task]: https://github.com/tabolario/snippety/blob/master/lib/tasks/lint.rake#11

#### SCSS

[scss-lint][scss-lint] is used to enforce SCSS coding conventions. The configuration for scss-lint can be found in
[.scss-lint.yml][scss-lint-yml]. The SCSS linter can be run by itself via:

    $ bin/rake lint:stylesheets

[scss-lint]: https://github.com/causes/scss-lint
[scss-lint-yml]: https://github.com/tabolario/snippety/blob/master/.scss-lint.yml

## Security

If you have discovered an issue with Snippety of a sensitive nature that could compromise the security of Snippety users, **please report it
securely by sending a GPG-encrypted message instead of filing an issue on GitHub**. Please use the following key and send your report to
[tony@tabolario.com](mailto:tony@tabolario.com).

[https://raw.githubusercontent.com/tabolario/snippety/master/tabolario.gpg][tabolario-gpg]

[tabolario-gpg]: https://raw.githubusercontent.com/tabolario/snippety/master/tabolario.gpg

The fingerprint of the key should be:

    6EED 2359 968F 7734 06A4 AB56 D90E 487A 60F1 0579

## Contributing and reporting issues

See [CONTRIBUTING.md][contributing-md] for full information on how to contribute or report issues to Snippety.

[contributing-md]: https://github.com/tabolario/snippety/blob/master/CONTRIBUTING.md

## Release process

Snippety follows [Semver 2.0.0](http://semver.org/spec/v2.0.0.html) for release versioning. The version number components X.Y.Z have
the following meanings:

* X for **Major** releases that may contain **backwards-incompatible** changes.
* Y for **Minor** releases that may contain features, bug fixes, and **backwards-compatible** changes.
* Z for **Patch** releases that only contain bug fixes and trivial changes.

**Pre-release** versions like `X.Y.Z.alpha.0` and `X.Y.Z.beta.1` will be made before **Major**, and **Minor** versions. Pre-release versions
are well-tested, but not as thoroughly as the versions that they precede.

Whenever a new version is made, it will be tagged as a release on [GitHub Releases][snippety-releases]. Entries in
[CHANGELOG.md][changelog-md] will be made incrementally up to the release. An announcement will also be made on
[Twitter][tabolario-twitter], [RubyFlow][rubyflow], [/r/ruby][ruby-subreddit] and [/r/rails][rails-subreddit].

[snippety-releases]: https://github.com/tabolario/snippety/releases
[changelog-md]: https://github.com/tabolario/snippety/blob/master/CHANGELOG.md
[tabolario-twitter]: https://twitter.com/tabolario
[rubyflow]: http://rubyflow.com/
[ruby-subreddit]: https://reddit.com/r/ruby
[rails-subreddit]: https://reddit.com/r/rails

When a new **Major** version is made, a corresponding branch will be created named `X-0-0` for further **Minor** and **Patch** releases on
that version.

## License

&copy; 2015 Tony Burns

**MIT License**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
