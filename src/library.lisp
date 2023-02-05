(uiop:define-package #:40ants-project-templates/library
  (:use #:cl)
  (:import-from #:mystic
                #:make-option)
  (:import-from #:mystic.template.file
                #:make-file)
  (:import-from #:40ants-project-templates/mixin/qlfile
                #:qlfile-mixin)
  (:import-from #:mystic.template.gitignore
                #:gitignore-mixin)
  (:import-from #:mystic.template.file
                #:file-mixin)
  (:import-from #:40ants-project-templates/mixin/docs
                #:docs-mixin)
  (:import-from #:40ants-project-templates/mixin/rove-tests
                #:rove-tests-mixin)
  (:import-from #:40ants-project-templates/mixin/ci
                #:ci-mixin)
  (:import-from #:cl-ppcre
                #:register-groups-bind))
(in-package #:40ants-project-templates/library)


(defclass library-template (qlfile-mixin
                            docs-mixin
                            ci-mixin
                            rove-tests-mixin
                            gitignore-mixin
                            file-mixin)
  ()
  (:default-initargs
   :name "40Ants Library"
   :docstring "A Common Lisp library with documentation, tests and CI."
   :options
   (list (make-option :name
                      "Name"
                      "The project's name."
                      :requiredp t)
         (make-option :author
                      "Author"
                      "The project author's name."
                      :requiredp t)
         (make-option :email
                      "Email"
                      "The project author's email.")
         (make-option :homepage
                      "Homepage"
                      "URL of the project's homepage.")
         (make-option :github
                      "GitHub URL"
                      "The project's URL on the GitHub.")
         (make-option :license
                      "License"
                      "The project's license string, e.g. 'MIT', 'GPLv3'."
                      :default "BSD")
         (make-option :description
                      "Description"
                      "A short, one-line description of the project."))
   :files (list
           (make-file :40ants-project-templates
                      "library/system.asd"
                      "{{ name }}.asd")
           (make-file :40ants-project-templates
                      "library/core.lisp"
                      "src/core.lisp")))
  (:documentation "Mystic template to create a Common Lisp library with documentation, tests and continuous integration."))



(defmethod mystic:validate-options :around ((template library-template) (options list) &key request-all-options-p)
  (let* ((result (call-next-method))
         (github-url (getf result :github)))
    (append (when github-url
              (register-groups-bind (user repo)
                  ("https://github.com/([^/]+)/([^/]+).*" github-url)
                (list :github-user user
                      :github-repo repo)))
            (values result))))
