(uiop:define-package #:40ants-project-templates/core
  (:use #:cl)
  (:import-from #:40ants-project-templates/library
                #:library-template)
  (:export #:library-template))
(in-package #:40ants-project-templates/core)


(mystic:register-template (make-instance 'library-template))
