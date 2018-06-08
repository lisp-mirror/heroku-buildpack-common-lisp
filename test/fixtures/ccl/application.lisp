(in-package #:cl-user)

(hunchentoot:define-easy-handler (root :uri "/") ()
  (cl-who:with-html-output-to-string (s nil :prologue t)
    (:html
      (:body
        (:p "hello, world")))))

(defvar *acceptor* nil)

(defun initialize-application (&key port)
  (setf hunchentoot:*dispatch-table*
    `(hunchentoot:dispatch-easy-handlers
       ,(hunchentoot:create-folder-dispatcher-and-handler
          "/")))

  (when *acceptor*
    (hunchentoot:stop *acceptor*))

  (setf *acceptor*
    (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port port)))