(uiop:define-package #:40ants-project-templates/cli-app
  (:use #:cl)
  (:import-from #:40ants-project-templates/library
                #:library-template
                #:make-core-file)
  (:import-from #:40ants-project-templates/utils
                #:merge-mystic-files
                #:ensure-template-docstring-has-options-description
                #:make-mystic-tree)
  (:import-from #:mystic.template.file
                #:make-file)
  (:export #:cli-app-template))
(in-package #:40ants-project-templates/cli-app)


(defclass cli-app-template (library-template)
  ()
  (:documentation "This template creates a generic CLI application.

                   Other behaviour is inherited from LIBRARY-TEMPLATE.
                   This template will provide:

                   - Roswell script to run the CLI program.
                   - Main entry point using DEFMAIN system.
                   - Basic structure for a command-line application.

                   Use 40ANTS-PROJECT-TEMPLATES:CREATE-CLI-APP function to generate a skeleton
                   for a new CLI application."))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (ensure-template-docstring-has-options-description 'cli-app-template))


(defmethod make-core-file ((template cli-app-template))
  "Returns a file object for CLI app's core.lisp which defines {{name}}/core package."
  (make-file :40ants-project-templates
             "cli-app/src/core.lisp"
             "src/core.lisp"))


(defmethod initialize-instance :around ((template cli-app-template) &rest args)
  (let ((new-args
          (list* :files
                 (merge-mystic-files
                  (append (getf args :files)
                          (make-mystic-tree "40ants-project-templates"
                                            (make-pathname :directory '(:relative
                                                                        "templates"
                                                                        "cli-app"))
                                            :renames '(("system.asd.template" . "{{ name }}.asd")
                                                       ("roswell/app.ros" . "roswell/{{ name }}.ros")))))
                 args)))
    (apply #'call-next-method template new-args)))
