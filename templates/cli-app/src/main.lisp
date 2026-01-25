(uiop:define-package #:{{name}}/main
  (:use #:cl)
  (:import-from #:defmain
                #:defmain)
  (:import-from #:{{name}}/core))
(in-package #:{{name}}/main)


(defmain (main) ()
  ({{name}}/core:main))
