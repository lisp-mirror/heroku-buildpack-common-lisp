Heroku Buildpack for OpenMCL's Common Lisp
==========================================

Recall that each Heroku application consists of the application
source and a buildpack.  The buildpack is used each time you
push your sources to Heroku to create the appliation slug(s).
As your application runs Heroku will instantiate instance of 
the slug(s).

This buildpack assumes you'd like to run a Common Lisp application.
It uses the 64 bit version Clozure Common Lisp (aka CCL) to load
your application's heroku-compile.lisp file; that file will
typically do little more use quickload to (re)compile your
application.  The buildpack then dumps an executable (./lispapp),
and executable goes into the slug along with all your sources.

An example application using this buildpack can be found here:
<tbd>.

This buildpack is decendant from Mike Traver's heroku-buildpack-cl2,
which in turn is decendant from ??? Fork of Mike's original
heroku-buildpack-cl.  No doubt as soon as your application gets
a bit more serious you'll want to fork this and customize the build
to your unique preferences.

## Usage

* Sign up for heroku, and install their tools.
* Fork the example.
* CD into that directory, and create a new application using this buildpack
* Push your sources (well the example's sources) to heroku, watch it build the slug.
* Visit your running application.

## Notes.

Disabling ASDF output tranlastions is necessary becuse Heroku performs
the `compile` step on one machine/directory, and then copies the
result into another machine/directory.  With default output
translations ASDF caches .fasl files according to the full path of
their source files. When the sources are moved to another location,
ASDF can not match them to the cached .fasls. In result full
recompilation will hapen at start time of your application.

With ASDF output translations disabled the .fasl files are placed near
the sources, and when copied together, ASDF still matches them.

See the [example application](https://github.com/avodonosov/heroku-cl-example2). 

## Notes
* Heroku does not have a persistent file system. Applications should use S3 for storage; [ZS3](http://www.xach.com/lisp/zs3) is a useful CL library for doing that.
* You can login into the server where your application is deployed and inspect it with `heroku run bash` command. See [one off dynos] (https://devcenter.heroku.com/articles/one-off-dynos).

## Credits
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl2
* [Anton Vodonosov] for his fork of heroku-buildpack-cl
* [Mike Travers](hyperphor.com) for heroku-buildpack-cl
* Heroku and their new [Buildpack-capable stack](http://devcenter.heroku.com/articles/buildpacks)
* [QuickLisp](http://www.quicklisp.org/) library manager 
* [Closure Common Lisp](http://ccl.clozure.com//)
* All other countless lispers and developers of all generations who made this possible.



