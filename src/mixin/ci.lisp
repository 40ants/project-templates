(uiop:define-package #:40ants-project-templates/mixin/ci
  (:use #:cl)
  (:import-from #:mystic.template.file
                #:file-mixin
                #:make-file
                #:files)
  (:export #:ci-mixin))
(in-package #:40ants-project-templates/mixin/ci)


(defclass ci-mixin (file-mixin)
  ()
  (:documentation "Adds docs based on 40ants-docs."))


(defmethod initialize-instance :after ((self ci-mixin) &rest args)
  (declare (ignore args))
  
  (setf (slot-value self 'files)
        (list*
         (make-file :40ants-project-templates
                    "mixin/ci/system.asd"
                    "{{ name }}-ci.asd")
         (make-file :40ants-project-templates
                    "mixin/ci/ci.lisp"
                    "src/ci.lisp")
         (slot-value self 'files))))


(defmethod mystic:render-template :around ((template ci-mixin) options directory)
  (declare (type list options)
           (type pathname directory))
  
  (let* ((results (multiple-value-list (call-next-method)))
         (asdf:*central-registry* (cons directory asdf:*central-registry*))
         (system-name (getf options :name))
         (ci-system-name (format nil "~A-ci" system-name)))
    ;; To create .github/workflows/*.yaml files we need to load the system
    #+quicklisp
    (ql:quickload ci-system-name)
    #-quicklisp
    (asdf:load-system ci-system-name)
    (values-list results)))
