(uiop:define-package #:40ants-project-templates/jsonrpc-app
  (:use #:cl)
  (:import-from #:40ants-project-templates/library
                #:library-template)
  (:import-from #:40ants-project-templates/utils
                #:ensure-template-docstring-has-options-description
                #:make-mystic-tree)
  (:import-from #:40ants-project-templates/mixin/qlfile
                #:qlfile-pieces)
  (:export #:jsonrpc-app-template))
(in-package #:40ants-project-templates/jsonrpc-app)


(defclass jsonrpc-app-template (library-template)
  ()
  (:documentation "This template creates a JSON-RPC API server.

                   Other behaviour is inherited from LIBRARY-TEMPLATE.
                   This server will provide:

                   - API methods created using OPENRPC-SERVER system.
                   - OpenRPC specification at /openrpc.json URI.
                   - Logging, configured to output data in JSON format.
                   - Optional SLYNK server running on port given as `SLYNK_PORT` env variable.

                   Use 40ANTS-PROJECT-TEMPLATES:CREATE-JSONRPC-APP function to generate a skeleton
                   for a new web service."))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (ensure-template-docstring-has-options-description 'jsonrpc-app-template))


(defmethod initialize-instance :around ((template jsonrpc-app-template) &rest args)
  (let ((new-args
          (if (getf args :files)
              args
              (list* :files
                     (make-mystic-tree "40ants-project-templates"
                                       (make-pathname :directory '(:relative
                                                                   "templates"
                                                                   "jsonrpc-app"))
                                       :renames '(("system.asd" . "{{ name }}.asd")
                                                  ("roswell/app.ros" . "roswell/{{ name }}.ros")))
                     args))))
    (apply #'call-next-method template new-args)))


;; (defmethod qlfile-pieces list ((template jsonrpc-app-template))
;;   "github reblocks-prometheus 40ants/reblocks-prometheus :branch master")
