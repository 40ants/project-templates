(uiop:define-package #:{{name}}/main
  (:use #:cl)
  (:import-from #:defmain
                #:defmain)
  (:import-from #:{{name}}/core
                #:start-in-production))
(in-package #:{{name}}/main)


(defmain (main) ()
  (start-in-production))
