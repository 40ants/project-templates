(uiop:define-package #:40ants-project-templates/mixin/clpm
  (:use #:cl)
  (:import-from #:mystic.template.file
                #:file-mixin
                #:make-file
                #:files)
  (:export #:clpm-mixin))
(in-package #:40ants-project-templates/mixin/clpm)


(defclass clpm-mixin (file-mixin)
  ()
  (:documentation "Adds clpmfile into the root of the project."))


(defmethod initialize-instance :after ((self clpm-mixin) &rest args)
  (declare (ignore args))
  (push (make-file :40ants-project-templates
                   "mixin/clpm/clpmfile"
                   "clpmfile")
        (slot-value self 'files)))

