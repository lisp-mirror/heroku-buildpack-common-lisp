(in-package :cl-user)

(flet ((env-to-dirs (x)
         (pathname-directory (pathname (concatenate 'string (getenv x) "/")))))
  (defvar *build-dir* (env-to-dirs "BUILD_DIR"))
  (defvar *cache-dir* (env-to-dirs "CACHE_DIR"))
  (defvar *buildpack-dir* (env-to-dirs "BUILDPACK_DIR")))

(format t "~&*build-dir* = ~a" *build-dir*)
(format t "~&*cache-dir* = ~a" *cache-dir*)
(format t "~&*buildpack-dir* = ~a" *buildpack-dir*)

;;; Tell ASDF to store binaries in the cache dir.
(ccl:setenv "XDG_CACHE_HOME" (concatenate 'string (getenv "CACHE_DIR") "/.asdf/"))

; (require :asdf) ;; we want quicklisp to control which asdf we get.

;;; Setup quicklisp (i.e. what is usually done in a user's init file).
(let ((ql-setup (make-pathname :directory (append *cache-dir* '("quicklisp")) :defaults "setup.lisp")))

  ;; If this is a fresh cache we need to install quicklisp first.
  (unless (probe-file ql-setup)
    (load (make-pathname :directory (append *buildpack-dir* '("lib")) :defaults "quicklisp.lisp"))
    (eval (read-from-string (format nil "(quicklisp-quickstart:install :path ~S)" 
                                    (make-pathname :directory (pathname-directory ql-setup))))))

  (load ql-setup))

;;; Notify ASDF that our build and cache dir is an awesomes place to find asf files.
(asdf:initialize-source-registry `(:source-registry
                                   (:tree ,(make-pathname :directory *buildpack-dir*))
                                   (:tree ,(make-pathname :directory *cache-dir*))
                                   :inherit-configuration))

;;; App can redefine this to do runtime initializations
(defun initialize-application (&key port)
  (declare (ignore port)))

;;; Default toplevel, app can redefine.
(defun heroku-toplevel ()
  (initialize-application :port (parse-integer (getenv "PORT")))
  (loop (sleep 600)))			;sleep forever

(defvar *root* "/app")			;this is always the app root on Heroku now?

;;; Run the app's own build.
(format t "~2&* Load application's heroku-compile.lisp ")
(load (make-pathname :directory *build-dir* :defaults "heroku-compile.lisp"))

;;; Save the application as an image
(let ((app-file (make-pathname :directory *build-dir* :defaults "lispapp")))
  ;; note that the buildpack's bin/release refers to this application name.
  (format t "~2&* save-application to create slug's lispapp, i.e. ~A" app-file)
  (save-application app-file
		    :prepend-kernel t
		    :toplevel-function #'heroku-toplevel))
