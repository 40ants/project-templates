(uiop:define-package #:40ants-project-templates/utils
  (:use #:cl)
  (:import-from #:mystic.template.file
                #:make-file)
  (:import-from #:mystic.template.file
                #:file))
(in-package #:40ants-project-templates/utils)


(defun path-match-pattern-p (path pattern)
  (pathname-match-p (uiop:ensure-absolute-pathname path #P"/")
                    (merge-pathnames (uiop:ensure-absolute-pathname pattern #P"/")
                                     uiop:*wild-path*)))


(defun should-be-ignored-p (path patterns-to-ignore)
  (when (member path patterns-to-ignore
                :test #'path-match-pattern-p)
    t))


(defun ensure-string (obj)
  (etypecase obj
    (string obj)
    (pathname (uiop:native-namestring obj))))


(defun make-mystic-tree (system-name path &key renames ignore-paths)
  "Returns a list of FILE objects matching the directory with PATHNAME.

   Usage example:

   CL-USER> (make-mystic-tree \"40ants-project-templates\" \"templates/reblocks-app/\"
                              :renames '((\"src/app.lisp\" . \"src/{{ name }}.lisp\"))
                              :ignore-paths '(\"src/pages/\"))
"
  
  (loop with root-pathname = (asdf:system-relative-pathname system-name path)
        for path in (uiop:directory-files root-pathname uiop:*wild-path*)
        for relative-path = (uiop:enough-pathname path root-pathname)
        for output-path-template = (or (cdr (assoc relative-path renames
                                                   :test #'uiop:pathname-equal))
                                       relative-path)
        unless (should-be-ignored-p relative-path ignore-paths)
        collect (make-instance 'file
                               :path (ensure-string output-path-template)
                               :content (uiop:read-file-string path))))



(defmethod print-object ((obj file) stream)
  "Makes files instead of this:

(#<FILE {100BC38963}> #<FILE {100BC38973}> #<FILE {1001A40023}>
 #<FILE {1001A40B03}> #<FILE {1001A40BB3}>)

Looks like this:

(#<FILE src/{{ name }}.lisp> #<FILE src/core.lisp> #<FILE src/server.lisp>
 #<FILE src/vars.lisp> #<FILE src/widgets/frame.lisp>)


"
  (print-unreadable-object (obj stream :type t)
    (format stream "~A"
            (mystic.template.file:file-path obj))))
