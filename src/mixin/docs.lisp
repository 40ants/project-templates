(uiop:define-package #:40ants-project-templates/mixin/docs
  (:use #:cl)
  (:import-from #:mystic.template.file
                #:file-mixin
                #:make-file
                #:files)
  (:export #:docs-mixin))
(in-package #:40ants-project-templates/mixin/docs)


(defclass docs-mixin (file-mixin)
  ()
  (:documentation "Adds docs based on 40ants-docs."))


(defmethod initialize-instance :after ((self docs-mixin) &rest args)
  (setf (slot-value self 'files)
        (list*
         (make-file :40ants-project-templates
                    "mixin/docs/system.asd"
                    "{{ name }}-docs.asd")
         (make-file :40ants-project-templates
                    "mixin/docs/index.lisp"
                    "docs/index.lisp")
         (make-file :40ants-project-templates
                    "mixin/docs/changelog.lisp"
                    "docs/changelog.lisp")
         (slot-value self 'files))))
