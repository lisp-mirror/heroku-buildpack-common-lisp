(in-package "CL-USER")

(hunchentoot:define-easy-handler  (home-page :uri "/") ()
  "<html><body>
     <b>This is a web page!</b><br/>
   </body></html>")

(defvar *my-acceptor* nil)

(defun initialize-application (&key port)

  (setf hunchentoot:*dispatch-table*
        `(hunchentoot:dispatch-easy-handlers
          ,(hunchentoot:create-folder-dispatcher-and-handler
            "/")))

  (when *my-acceptor*
    (hunchentoot:stop *my-acceptor*))

  (setf *my-acceptor*
        (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port port)))
