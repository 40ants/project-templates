(uiop:define-package #:40ants-project-templates/mixin/gitignore
  (:use #:cl)
  (:import-from #:mystic.template.file
                #:file-mixin
                #:make-file
                #:files)
  (:export #:*patterns*
           #:gitignore-mixin
           #:patterns-to-ignore))
(in-package #:40ants-project-templates/mixin/gitignore)


(defclass gitignore-mixin ()
  ()
  (:documentation "Adds .gitignore into the root of the project."))


(defvar *patterns*
  (list "*~"
        ".#*"
        "*.fasl"
        ".*.~undo-tree~")
  "Default list of patterns which returned by PATTERNS-TO-IGNORE generic function.")


(defgeneric patterns-to-ignore (template)
  (:documentation "Should return a list of patterns to add to .gitignore. Default method takes them from *PATTERNS* variable.")
  (:method ((template t))
    *patterns*))


(defmethod mystic:render-template progn ((template gitignore-mixin) options directory)
  (declare (type list options)
           (type pathname directory))
  (let* ((full-file-path (merge-pathnames ".gitignore"
                                          directory))
         (content
           (with-output-to-string (s)
             (loop for pattern in (patterns-to-ignore template)
                   do (write-string pattern s)
                      (terpri s)))))
    (mystic.util:write-file content full-file-path)))
