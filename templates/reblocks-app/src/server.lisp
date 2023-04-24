(uiop:define-package #:{{name}}/server
  (:use #:cl)
  (:import-from #:clack-handler-hunchentoot)
  (:import-from #:reblocks/server)
  (:import-from #:reblocks/debug)
  (:import-from #:reblocks/variables)
  (:import-from #:40ants-logging)
  (:import-from #:40ants-slynk)
  (:import-from #:local-time)
  (:import-from #:cl+ssl)
  (:import-from #:{{name}}/app
                #:app)
  (:shadow #:restart)
  (:export #:start
           #:restart
           #:stop))
(in-package #:{{name}}/server)


(defvar *default-port* "8000")
(defvar *default-interface* "localhost")

(defvar *arguments* nil
  "Here we remember arguments given to START to apply them when restarting the server.")


(defun start (&rest args
              &key
              (port (parse-integer
                     (or (uiop:getenv "PORT")
                         *default-port*)))
	      (interface *default-interface*)
              (debug nil))
  "This function does not block and can be started in REPL."
  
  (when (probe-file ".local-config.lisp")
    (load (probe-file ".local-config.lisp")))
  
  ;; Just to suppres debug logs to TTY from Reblocks.
  ;; I'll need to fix Reblocks to prohibit it from
  ;; configure logging if they are already configured.
  (40ants-logging:setup-for-backend :level (if debug
                                               :debug
                                               :warn))
  (40ants-slynk:start-slynk-if-needed)
  (local-time:reread-timezone-repository)

  ;; TODO: Probably it is not necessary?
  (let ((postgres-certs-file
          (probe-file "~/.postgresql/root.crt")))
    (when postgres-certs-file
      (cl+ssl:ssl-load-global-verify-locations postgres-certs-file)))

  (setf reblocks/variables:*pages-expire-in* (* 10 60))
  (setf reblocks/variables:*max-pages-per-session* 10)

  (reblocks/server:start :port port
			 :interface interface
                         :apps 'app
                         ;; WOO requires libev, and also
                         ;; there is a problem with hanging workers:
                         ;; https://github.com/fukamachi/woo/issues/100
			 :server-type :hunchentoot
                         :debug debug)

  ;; Previously I need this because Relocks start broke logging configuration
  ;; (40ants-logging:setup-for-backend)

  (log:info "Server started")
  (setf *arguments* args)
  ;; To suppress debugger on missing actions
  (setf reblocks/variables:*ignore-missing-actions* t)
  (values))


(defun start-server-in-production ()
  ;; Entry point for webapp, started in the Docker
  (start :port (parse-integer (or (uiop:getenv "APP_PORT")
                                  *default-port*))
	 :interface (or (uiop:getenv "APP_INTERFACE")
                        *default-interface*))
  (loop do (sleep 5)))


(defun stop ()
  (reblocks/server:stop (getf *arguments* :interface)
                        (getf *arguments* :port))
  (values))


(defun restart (&key (reset-latest-session t))
  (stop)
  (apply #'start *arguments*)
  (when (and reset-latest-session
             (reblocks/debug:status))
    (with-simple-restart (ignore "Ignore and continue")
      (reblocks/debug:reset-latest-session)))
  (values))
