(uiop:define-package #:40ants-project-templates/reblocks-app
  (:use #:cl)
  (:import-from #:40ants-project-templates/core
                #:library-template)
  (:import-from #:40ants-project-templates/utils
                #:make-mystic-tree)
  (:import-from #:40ants-project-templates/mixin/qlfile
                #:qlfile-pieces)
  (:export
   #:reblocks-app-template))
(in-package #:40ants-project-templates/reblocks-app)


(defclass reblocks-app-template (library-template)
  ())


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
