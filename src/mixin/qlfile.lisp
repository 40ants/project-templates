(uiop:define-package #:40ants-project-templates/mixin/qlfile
  (:use #:cl)
  (:import-from #:40ants-project-templates/mixin/gitignore)
  (:import-from #:mystic.template.file
                #:file-mixin
                #:make-file
                #:files)
  (:import-from #:mystic.util
                #:read-template-file)
  (:import-from #:mystic.template.file
                #:file)
  (:import-from #:str
                #:join)
  (:export
   #:qlfile-mixin
   #:qlfile-pieces))
(in-package #:40ants-project-templates/mixin/qlfile)


(defvar +empty-line+ "

")


(defclass qlfile-mixin (file-mixin)
  ()
  (:documentation "Adds qlfile into the root of the project."))


(defgeneric qlfile-pieces (template)
  (:documentation "Returns a list of strings which will be concatentated to build a qlfile.")
  (:method-combination list)
  (:method list ((template t))
    nil))


(defmethod initialize-instance :after ((self qlfile-mixin) &rest args)
  (declare (ignore args))
  (let* ((content (read-template-file "mixin/qlfile/qlfile"
                                      :asdf-system :40ants-project-templates))
         (additional-content (remove nil (nreverse (qlfile-pieces self))))
         (qlfile (make-instance 'file
                                :path "qlfile"
                                :content (join +empty-line+
                                               (list* content
                                                      additional-content)))))
    (push qlfile
          (slot-value self 'files))))


(defmethod 40ants-project-templates/mixin/gitignore:patterns-to-ignore ((template qlfile-mixin))
  (list* ".qlot/"
         (call-next-method)))
