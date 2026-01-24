(uiop:define-package #:{{name}}/core
  (:use #:cl)
  (:export #:main))
(in-package #:{{name}}/core)


(defun main ()
  "Main entry point for the CLI application.
   
   Implement your application logic here."
  (format t "Hello from ~A!~%" "{{name}}"))
