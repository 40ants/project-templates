(uiop:define-package #:{{ name }}-tests/core
  (:use #:cl)
  (:import-from #:rove
                #:deftest
                #:ok
                #:testing))
(in-package #:{{ name }}-tests/core)


(deftest test-example ()
  (ok t "Replace this test with something useful."))
