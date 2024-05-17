(uiop:define-package #:40ants-project-templates/library
  (:use #:cl)
  (:import-from #:mystic
                #:make-option)
  (:import-from #:40ants-project-templates/mixin/qlfile
                #:qlfile-mixin)
  (:import-from #:40ants-project-templates/mixin/gitignore
                #:gitignore-mixin)
  (:import-from #:mystic.template.file
                #:file-mixin
                #:make-file)
  (:import-from #:40ants-project-templates/mixin/docs
                #:docs-mixin)
  (:import-from #:40ants-project-templates/mixin/rove-tests
                #:rove-tests-mixin)
  (:import-from #:40ants-project-templates/mixin/ci
                #:ci-mixin)
  (:import-from #:cl-ppcre
                #:register-groups-bind)
  (:import-from #:40ants-project-templates/mixin/clpm
                #:clpm-mixin)
  (:import-from #:40ants-project-templates/utils
                #:ensure-template-docstring-has-options-description)
  (:export #:make-system-file
           #:make-core-file
           #:library-template))
(in-package #:40ants-project-templates/library)


(defclass library-template (qlfile-mixin
                            clpm-mixin
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
                      "A short, one-line description of the project.")))
  (:documentation "Mystic template to create a Common Lisp library with documentation, tests and continuous integration.

Use 40ANTS-PROJECT-TEMPLATES:CREATE-LIBRARY function to generate a skeleton for a new CL library.

## Included mixins

- QLFILE-MIXIN
- CLPM-MIXIN
- DOCS-MIXIN
- CI-MIXIN
- ROVE-TESTS-MIXIN
- GITIGNORE-MIXIN

"))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ensure-template-docstring-has-options-description 'library-template))


(defgeneric make-system-file (template)
  (:documentation "Should return a file object, which creates `{{ name }}.asd` file.")
  (:method ((template library-template))
    (make-file :40ants-project-templates
               "library/system.asd.template"
               "{{ name }}.asd")))


(defgeneric make-core-file (template)
  (:documentation "Should return a file object, which creates main lisp file.

                   Use MAKE-FILE function to create a MYSTIC.TEMPLATE.FILE:FILE object.")
  (:method ((template library-template))
    (make-file :40ants-project-templates
               "library/core.lisp"
               "src/core.lisp")))


(defmethod initialize-instance :around ((template library-template) &rest args)
  (let ((new-args
          (if (getf args :files)
              args
              (list* :files (list (make-system-file template)
                                  (make-core-file template))
                     args))))
    (apply #'call-next-method template new-args)))


(defmethod mystic:validate-options :around ((template library-template) (options list) &key request-all-options-p)
  (declare (ignore request-all-options-p))
  
  (let* ((result (call-next-method))
         (github-url (getf result :github)))
    (append (when github-url
              (register-groups-bind (user repo)
                  ("https://github.com/([^/]+)/([^/]+).*" github-url)
                (list :github-user user
                      :github-repo repo)))
            (values result))))
