# Heroku Buildpack for Common Lisp

[![pipeline status](https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp/badges/master/pipeline.svg)](https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp/commits/master)

This buildpack allows you to build Common Lisp web applications with Common Lisp, and deploy them to the [Heroku](https://heroku.com/) platform.

## licence
heroku-buildpack-common-lisp is licensed under the GNU Lesser General Public License.

### why the LGPL?
The GPL is specifically designed to reduce the usefulness of GPL-licensed code to closed-source, proprietary software. The BSD license (and similar) do not mandate code-sharing if the BSD-licensed code is modified by licensees. The LGPL achieves the best of both worlds: an LGPL-licensed library can be incorporated within closed-source proprietary code, and yet those using an LGPL-licensed library are required to release source code to that library if they change it.

## credits
* The [author](https://github.com/roswell/roswell#author) and [https://github.com/roswell/roswell#contributors](contributors) of [Roswell](https://github.com/roswell/roswell).
* [bhyde](https://github.com/bhyde) for [heroku-buildpack-ccl64](https://github.com/bhyde/heroku-buildpack-ccl64).
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl2.
* [Anton Vodonosov](https://github.com/avodonosov) for his fork of heroku-buildpack-cl.
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl.
* Heroku and their new [Buildpack-capable stack](http://devcenter.heroku.com/articles/buildpacks).
* [QuickLisp](http://www.quicklisp.org/) library manager.
* [Clozure Common Lisp](http://ccl.clozure.com//).
* All other countless lispers and developers of all generations who made this possible.
