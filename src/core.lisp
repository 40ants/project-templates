(uiop:define-package #:40ants-project-templates
  (:use #:cl)
  (:nicknames #:40ants-project-templates/core)
  (:import-from #:40ants-project-templates/library
                #:library-template)
  (:import-from #:40ants-project-templates/reblocks-app
                #:reblocks-app-template)
  (:import-from #:40ants-project-templates/jsonrpc-app
                #:jsonrpc-app-template)
  (:export #:library-template
           #:reblocks-app-template
           #:create-library
           #:create-reblocks-app
           #:create-jsonrpc-app))
(in-package #:40ants-project-templates)


(eval-when (:compile-toplevel :load-toplevel :execute)
  (mystic:register-template (make-instance 'library-template))
  (mystic:register-template (make-instance 'reblocks-app-template))
  (mystic:register-template (make-instance 'jsonrpc-app-template)))


(defun create-library (directory-path name description &key request-all-options)
  "Creates Common Lisp library in the specified directory.

   Pass :REQUEST-ALL-OPTIONS T to fill all optional options or use more generic
   call to MYSTIC:RENDER function to pass any options you like as a list.
   "
  (check-type directory-path pathname)
  (check-type name string)
  (check-type description string)
  (mystic:render  (make-instance 'library-template)
                  (list :name name
                        :description description)
                  directory-path
                  :request-all-options-p request-all-options))


(defun create-reblocks-app (directory-path name description &key request-all-options)
  "Creates Common Lisp web application in the specified directory.

   Pass :REQUEST-ALL-OPTIONS T to fill all optional options or use more generic
   call to MYSTIC:RENDER function to pass any options you like as a list.
   "
  (check-type directory-path pathname)
  (check-type name string)
  (check-type description string)
  (mystic:render  (make-instance 'reblocks-app-template)
                  (list :name name
                        :description description)
                  directory-path
                  :request-all-options-p request-all-options))


(defun create-jsonrpc-app (directory-path name description &key request-all-options)
  "Creates Common Lisp RPC API application in the specified directory.

   Pass :REQUEST-ALL-OPTIONS T to fill all optional options or use more generic
   call to MYSTIC:RENDER function to pass any options you like as a list.
   "
  (check-type directory-path pathname)
  (check-type name string)
  (check-type description string)
  (mystic:render  (make-instance 'jsonrpc-app-template)
                  (list :name name
                        :description description)
                  directory-path
                  :request-all-options-p request-all-options))

