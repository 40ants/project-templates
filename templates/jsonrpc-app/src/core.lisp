(uiop:define-package #:{{name}}
  (:use #:cl)
  (:nicknames #:{{name}}/core)
  (:import-from #:40ants-openrpc)
  (:import-from #:40ants-openrpc/server)
  (:import-from #:{{name}}/pets
                #:pets-api)
  (:export #:start
           #:stop
           #:start-in-production))
(in-package #:{{name}})


(defun start ()
  (40ants-openrpc/server:start :api pets-api))

(defun stop ()
  (40ants-openrpc/server:stop :api pets-api))

(defun start-in-production ()
  (40ants-openrpc/server:start-in-production :api pets-api))


