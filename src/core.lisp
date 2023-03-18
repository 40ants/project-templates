(uiop:define-package #:40ants-project-templates/core
  (:use #:cl)
  (:import-from #:40ants-project-templates/library
                #:library-template)
  (:import-from #:40ants-project-templates/reblocks-app
                #:reblocks-app-template)
  (:export #:library-template
           #:reblocks-app-template))
(in-package #:40ants-project-templates/core)


;; (progn
;;   (setf mystic::*templates* nil))
(mystic:register-template (make-instance 'library-template))
(mystic:register-template (make-instance 'reblocks-app-template))
