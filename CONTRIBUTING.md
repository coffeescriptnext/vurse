# Contributing to Snippety

Thank you for interest in contributing to Snippety!

Snippety uses GitHub issues for discussion, issues, and contributions. There are two main ways to contribute to Snippety:

One of the goals of Snippety is to make it easy for the community to contribute changes. To that end, here are detailed guidelines on how to
contribute to Snippety.

* Report an issue or make a feature request at Snippety's [issue tracker][issue-tracker]
* Contribute features and fix bugs yourself by contributing code to Snippety (see below).

[issue-tracker]: https://github.com/tabolario/snippety/issues

## Issues

Issue tracking for Snippety happens on GitHub Issues. If you've found a bug or have a feature that you'd like to see implemented, please
report it on the issue tracker. Discussion-only issues are also welcome.

### Bug reports

To minimize the time spent by maintainers in diagnosing and fixing bugs, please use the following template when filing a bug report:

```text
### Version

[Version of Snippety deployed, or commit SHA if installed from Git]

### Environment

Operating system: [Your operating system and version, (e.g. Mac OS X 10.10)
Ruby version: [Version of Ruby installed (run `ruby --version`)
PostgreSQL version: [Version of PostgreSQL installed (run `postgres --version`)
Browser and version: [Which browser(s) and version(s) (i.e. Chrome 39)]

[Include any other information about your environment that might be helpful, such as your reverse proxy configuration if running Snippety
behind something like Nginx or Apache.]

### Scenario

[What are you attempting to do that isn't working?]

### Steps to reproduce

[What are the things we need to do in order to reproduce the problem?]

### Expected result:

[What are you expecting to happen when the above steps to reproduce are performed?]

### Actual result:

[What actually happens when the above steps to reproduce are performed?]
```

Please include screenshots if applicable.

### Security issues

If you have discovered an issue with Snippety of a sensitive nature that could compromise the security of Snippety users, **please report it
securely by sending a GPG-encrypted message instead of filing an issue on GitHub**. Please use the following key and send your report to
[tony@tabolario.com](mailto:tony@tabolario.com).

[https://raw.github.com/tabolario/snippety/tabolario.gpg][tabolario-gpg]

[tabolario-gpg]: https://raw.github.com/tabolario/snippety/tabolario.gpg

The fingerprint of the key should be:

    6EED 2359 968F 7734 06A4 AB56 D90E 487A 60F1 0579

### Discussions

Issues to discuss the architecture, design, and functionality of Snippety are welcome on the issue tracker, and this is where these
discussions are preferred so that we can track them and associate them with issues if necessary.

## Pull requests

### Getting started

* [Fork](https://github.com/tabolario/snippety/fork) the repository on GitHub.
* Set up your local development environment with `bin/setup`.
* Make sure the test suite runs for you: `bin/rake`

### Making changes

* Create a topic branch for your work.
  - Prefer to target `master` for new topic branches (`git checkout -b feature/my-new-feature master`).
  - Only target release branches (e.g. `X-0-0`) if your change *must* be for that release.
  - Avoid working directly on the `master` branch.
* Make atomic commits of logical units.
* Check to make sure your changes adhere to the project style guide and linter configuration with `bin/rake lint`
* Write unit and integration tests as necessary for your changes. **Pull requests will not be accepted for non-trivial changes without
  tests.**
* Ensure that the entire test suite passes with `bin/rake`.
* Create a pull request on GitHub for your contribution.
* Check [Travis CI](https://travis-ci.org/tabolario/snippety/pull_requests) for your pull request. **Only green pull requests will
  be merged.**

### Trivial changes

Certain types of changes do not need to undergo the same process as changes involving the functionality of Snippety (e.g. running
tests and static analysis tools). These types of changes include:

* Changes to "root documentation" like `README.md`, `CHANGELOG.md`, documents in the `docs` directory, and this document
* Changes to build scripts, and other development configuration files
* Comment cleanup
* Formatting cleanup
* Spelling/grammar fixes
* Typo corrections

Trivial changes **do** need to pass the linting tasks (`bin/rake lint`) if they make changes to any Ruby, JavaScript, or SCSS code.

## Getting help

A number of support channels are available for getting help with Snippety:

* [![Gitter chat](https://badges.gitter.im/tabolario/snippety.png)](https://gitter.im/tabolario/snippety)
* Email: [tony@tabolario.com](mailto:tony@tabolario.com)
* Twitter: [@tabolario](https://twitter.com/tabolario)
