# Heroku Buildpack for Common Lisp

<!-- TODO: duncan@bayne.id.au: Fix use of postimg once https://gitlab.com/gitlab-org/gitlab-ce/issues/17987 is resolved. -->
[![pipeline status](https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp/badges/master/pipeline.svg)](https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp/commits/master) ![lisp logo](https://s22.postimg.cc/rhfrsvgwh/lisp-lizard-with-text.png)

This buildpack allows you to build web applications with Common Lisp, and deploy them to the [Heroku](https://heroku.com/) platform.

<!-- TODO: duncan@bayne.id.au: Fix use of postimg once https://gitlab.com/gitlab-org/gitlab-ce/issues/17987 is resolved. -->
![webapp screenshot](https://s33.postimg.cc/nqliwvlnz/Screen_Shot_2018-06-08_at_12.18.28.png)

## tutorial

To start deploying Common Lisp applications to Heroku, you'll need to have:

1. a Heroku account
2. the Heroku CLI (Command Line Interface)
3. a Common Lisp development environment
4. an application to deploy

### a Heroku account

You can [sign up for Heroku](https://signup.heroku.com/) free of charge.

### the Heroku CLI

Heroku has extensive documentation on [installing and configuring the Heroku CLI](https://devcenter.heroku.com/categories/command-line).

### a Common Lisp development environment

These days, the best way of setting up your Common Lisp development environment is [Roswell](https://github.com/roswell/roswell).  If you've used Clojure before, it's analogous to Leiningen.  Rubyists, think rbenv.

For the purposes of this tutorial, once you've installed Roswell, you'll need to install Clozure Common Lisp with:

```
ros install ccl-bin
ros use ccl-bin
```

### an application to deploy

The easiest way of getting started is to clone a template application, create a Heroku app for it, and deploy.

```
# Clone the sample application.
git clone git@gitlab.com:duncan-bayne/heroku-app-clozure-common-lisp.git

# Create a Heroku app for it, using the heroku-18 stack and this buildpack.
cd heroku-app-clozure-common-lisp
heroku create -s heroku-18 --buildpack https://gitlab.com/duncan-bayne/heroku-buildpack-common-lisp

# Deploy it.
git push heroku master

# Open it in a browser.
heroku open
```

## development

### history

This buildpack is a forked and highly modified version of [bhyde](https://github.com/bhyde)'s [heroku-buildpack-ccl64](https://github.com/bhyde/heroku-buildpack-ccl64).

### principles

1. Use modern Common Lisp tooling (in particular, [Roswell](https://github.com/roswell/roswell) and [QuickLisp](http://www.quicklisp.org/)).
2. Use CI and linting to prevent bit-rot and avoidable bugs.
3. Support the latest Heroku stack (currently [heroku-18](https://devcenter.heroku.com/articles/heroku-18-stack)).
4. Support any common Common Lisp implementations (currently any supported by Roswell).

## FAQ

### How do I choose a different Common Lisp implementation, like SBCL?
This buildpack supports any Common Lisp implementation supported by Roswell.  To set the implementation to something other than Clozure Common Lisp, set the `CL_IMPL` setting _on your application_.

For example, to use Steel Bank Common Lisp:

```
cd heroku-app-clozure-common-lisp
heroku config:set CL_IMPL=sbcl-bin
```


## licence
heroku-buildpack-common-lisp is licensed under the GNU Lesser General Public License.

### why the LGPL?
The GPL is specifically designed to reduce the usefulness of GPL-licensed code to closed-source, proprietary software. The BSD license (and similar) do not mandate code-sharing if the BSD-licensed code is modified by licensees. The LGPL achieves the best of both worlds: an LGPL-licensed library can be incorporated within closed-source proprietary code, and yet those using an LGPL-licensed library are required to release source code to that library if they change it.

## credits
* [bhyde](https://github.com/bhyde) for [heroku-buildpack-ccl64](https://github.com/bhyde/heroku-buildpack-ccl64).
* The [author](https://github.com/roswell/roswell#author) and [contributors](https://github.com/roswell/roswell#contributors) of [Roswell](https://github.com/roswell/roswell).
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl2.
* [Anton Vodonosov](https://github.com/avodonosov) for his fork of heroku-buildpack-cl.
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl.
* Heroku and their new [Buildpack-capable stack](http://devcenter.heroku.com/articles/buildpacks).
* [Zach Beane](https://github.com/xach) for [QuickLisp](http://www.quicklisp.org/) library manager.
* [Clozure Common Lisp](http://ccl.clozure.com/).
* [azzamsa](https://github.com/azzamsa) for the [SVG Lisp Logo](https://github.com/azzamsa/lisp-logo), Manfred Spiller for the original design, and [Xah Lee](http://xahlee.info/) for the background.
* All other countless lispers and developers of all generations who made this possible.
