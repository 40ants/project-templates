(uiop:define-package #:40ants-project-templates/mixin/rove-tests
  (:use #:cl)
  (:import-from #:mystic.template.file
                #:file-mixin
                #:make-file
                #:files)
  (:export #:rove-tests-mixin))
(in-package #:40ants-project-templates/mixin/rove-tests)


(defclass rove-tests-mixin (file-mixin)
  ()
  (:documentation "Adds tests based on Rove."))


(defmethod initialize-instance :after ((self rove-tests-mixin) &rest args)
  (declare (ignore args))
  
  (setf (slot-value self 'files)
        (list*
         (make-file :40ants-project-templates
                    "mixin/rove-tests/system.asd"
                    "{{ name }}-tests.asd")
         (make-file :40ants-project-templates
                    "mixin/rove-tests/core.lisp"
                    "t/core.lisp")
         (slot-value self 'files))))
