# Heroku Buildpack for Common Lisp

[![pipeline status](https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp/badges/master/pipeline.svg)](https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp/commits/master) ![lisp logo](https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp/raw/master/assets/lisp-lizard-with-text.svg)

This buildpack allows you to build Common Lisp web applications with Common Lisp, and deploy them to the [Heroku](https://heroku.com/) platform.

## development

### history

This buildpack is forked and highly modified version of [bhyde](https://github.com/bhyde)'s [heroku-buildpack-ccl64](https://github.com/bhyde/heroku-buildpack-ccl64).

### principles

1. Use modern Common Lisp tooling (in particular, [Roswell](https://github.com/roswell/roswell) and [QuickLisp](http://www.quicklisp.org/)).
2. Use CI and linting to prevent bit-rot and avoidable bugs.
3. Support the latest Heroku stack (currently [heroku-18](https://devcenter.heroku.com/articles/heroku-18-stack)).
4. Support multiple Common Lisp implementations (currently just [Clozure Common Lisp](http://ccl.clozure.com/), with more coming soon).

## licence
heroku-buildpack-common-lisp is licensed under the GNU Lesser General Public License.

### why the LGPL?
The GPL is specifically designed to reduce the usefulness of GPL-licensed code to closed-source, proprietary software. The BSD license (and similar) do not mandate code-sharing if the BSD-licensed code is modified by licensees. The LGPL achieves the best of both worlds: an LGPL-licensed library can be incorporated within closed-source proprietary code, and yet those using an LGPL-licensed library are required to release source code to that library if they change it.

## credits
* [bhyde](https://github.com/bhyde) for [heroku-buildpack-ccl64](https://github.com/bhyde/heroku-buildpack-ccl64).
* The [author](https://github.com/roswell/roswell#author) and [https://github.com/roswell/roswell#contributors](contributors) of [Roswell](https://github.com/roswell/roswell).
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl2.
* [Anton Vodonosov](https://github.com/avodonosov) for his fork of heroku-buildpack-cl.
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl.
* Heroku and their new [Buildpack-capable stack](http://devcenter.heroku.com/articles/buildpacks).
* [Zach Beane](https://github.com/xach) for [QuickLisp](http://www.quicklisp.org/) library manager.
* [Clozure Common Lisp](http://ccl.clozure.com/).
* [azzamsa](https://github.com/azzamsa) for the [SVG Lisp Logo](https://github.com/azzamsa/lisp-logo), Manfred Spiller for the original design, and [Xah Lee](http://xahlee.info/) for the background.
* All other countless lispers and developers of all generations who made this possible.
