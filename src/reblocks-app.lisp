(uiop:define-package #:40ants-project-templates/reblocks-app
  (:use #:cl)
  (:import-from #:40ants-project-templates/library
                #:library-template)
  (:import-from #:40ants-project-templates/utils
                #:ensure-template-docstring-has-options-description
                #:make-mystic-tree)
  (:import-from #:40ants-project-templates/mixin/qlfile
                #:qlfile-pieces)
  (:export
   #:reblocks-app-template))
(in-package #:40ants-project-templates/reblocks-app)


(defclass reblocks-app-template (library-template)
  ()
  (:documentation "This template creates a Reblocks web application with a few simple widgets.

                   Other behaviour is inherited from LIBRARY-TEMPLATE"))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (ensure-template-docstring-has-options-description 'reblocks-app-template))


(defmethod initialize-instance :around ((template reblocks-app-template) &rest args)
  (let ((new-args
          (if (getf args :files)
              args
              (list* :files
                     (make-mystic-tree "40ants-project-templates"
                                       (make-pathname :directory '(:relative
                                                                   "templates"
                                                                   "reblocks-app"))
                                       :renames '(("system.asd" . "{{ name }}.asd")))
                     args))))
    (apply #'call-next-method template new-args)))


(defmethod qlfile-pieces list ((template reblocks-app-template))
  "github reblocks-prometheus 40ants/reblocks-prometheus :branch master")
