(uiop:define-package #:40ants-project-templates/mixin/docs
  (:use #:cl)
  (:import-from #:40ants-project-templates/mixin/gitignore)
  (:import-from #:str)
  (:import-from #:alexandria)
  (:import-from #:mystic
                #:make-option)
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
  (declare (ignore args))
  
  (setf (slot-value self 'mystic::options)
        (list*
         (make-option :doc-theme
                      "Documentation Theme"
                      "A theme name in the form of the fully specified symbol name (as a string). Example: 40ants-doc-theme-40ants:40ants-theme.")
         (slot-value self 'mystic::options)))
  
  (setf (slot-value self 'files)
        (list*
         (make-file :40ants-project-templates
                    "mixin/docs/empty.md"
                    "README.md")
         (make-file :40ants-project-templates
                    "mixin/docs/empty.md"
                    "ChangeLog.md")
         (make-file :40ants-project-templates
                    "mixin/docs/system.asd.template"
                    "{{ name }}-docs.asd")
         (make-file :40ants-project-templates
                    "mixin/docs/index.lisp"
                    "docs/index.lisp")
         (make-file :40ants-project-templates
                    "mixin/docs/changelog.lisp"
                    "docs/changelog.lisp")
         (slot-value self 'files))))


(defmethod mystic:validate-options :around ((template docs-mixin) (options list) &key request-all-options-p)
  (declare (ignore request-all-options-p))
  
  (let* ((result (call-next-method))
         (doc-theme (getf result :doc-theme)))
    (flet ((raise (problem)
             (error 'mystic:bad-option-value
                    :option-name :doc-theme
                    :docstring "A theme name in the form of the fully specified symbol name (as a string)."
                    :value doc-theme
                    :problem problem)))
      (append (when doc-theme
                (let ((splitted (str:split #\: doc-theme)))
                  (unless (alexandria:length= 2 splitted)
                    (raise "Values should be a string in \"package:symbol\" format."))
                  (let* ((package-name (string-upcase (first splitted)))
                         (symbol-name (string-upcase (second splitted)))
                         (system-name (string-downcase package-name)))
                    (handler-case
                        (progn
                          #+quicklisp
                          (ql:quickload system-name)
                          #-quicklisp
                          (asdf:load-system system-name))
                      (error ()
                        (raise (format nil "Unable to load system ~S."
                                       system-name))))
                    (let ((package (find-package package-name)))
                      (unless package
                        (raise (format nil "Unable to find package ~S."
                                       package-name)))
                      (let ((symbol (find-symbol symbol-name package)))
                        (unless symbol
                          (raise (format nil "Unable to find symbol ~A:~A."
                                         package-name
                                         symbol-name)))

                        ;; If all checks are OK, then we'll add these variables to the context:
                        (list :doc-theme-system system-name
                              :doc-theme-package package-name
                              :doc-theme-symbol symbol-name))))))
              (values result)))))


(defmethod 40ants-project-templates/mixin/gitignore:patterns-to-ignore ((template docs-mixin))
  (list* "/docs/build/"
         (call-next-method)))
