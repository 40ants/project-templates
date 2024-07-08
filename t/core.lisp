(uiop:define-package #:40ants-project-templates-tests/core
  (:use #:cl)
  (:import-from #:40ants-project-templates)
  (:import-from #:rove
                #:deftest
                #:ok)
  (:import-from #:docs-builder)
  (:import-from #:alexandria
                #:once-only
                #:with-gensyms))
(in-package #:40ants-project-templates-tests/core)


(defmacro with-temp-path ((lib-name tmp-path-var) &body body)
  (with-gensyms (temp-file)
    (once-only (lib-name)
      `(let* ((,temp-file (uiop:tmpize-pathname
                           (make-pathname :name ,lib-name
                                          :directory '(:absolute "tmp"))))
              (,tmp-path-var (uiop:ensure-directory-pathname ,temp-file)))
         (uiop:delete-file-if-exists ,temp-file)
        
         (unwind-protect
              (progn ,@body)
           (when (probe-file ,tmp-path-var)
             (uiop:delete-directory-tree ,tmp-path-var :validate t)))))))


(deftest test-a-library-has-docs
  (let* ((lib-name "foo-bar")
         (docs-system-name (format nil "~A-docs" lib-name)))
    (with-temp-path (lib-name tmp-path)
      (mystic:render (make-instance '40ants-project-templates/core:library-template)
                     (list :name lib-name
                           :author "Alexander Artemenko")
                     tmp-path)
      ;; Now we need to create .git/HEAD to suppress a warning from 40ants-doc about it's inability
      ;; to get a GIT-VERSION
      (let ((head-path (merge-pathnames (make-pathname :name "HEAD"
                                                       :directory '(:relative ".git"))
                                        tmp-path)))
        (ensure-directories-exist head-path)
        (alexandria:write-string-into-file "12345" head-path))
      
      (ok (probe-file
           (merge-pathnames (format nil "~A.asd" lib-name)
                            tmp-path)))
      (let* ((asdf:*central-registry* (cons tmp-path
                                            asdf:*central-registry*))
             (resulting-path (progn (asdf:load-system docs-system-name)
                                    (docs-builder:build docs-system-name)))
             (index.html (merge-pathnames
                          (make-pathname :name "index"
                                         :type "html")
                          resulting-path))
             (changelog.html (merge-pathnames
                              (make-pathname :name "index"
                                             :type "html"
                                             :directory '(:relative "changelog"))
                              resulting-path))
             (README.md (merge-pathnames
                         (make-pathname :name "README"
                                        :type "md")
                         tmp-path))
             (ChangeLog.md (merge-pathnames
                            (make-pathname :name "ChangeLog"
                                           :type "md")
                            tmp-path))
             (expected-files (list index.html changelog.html
                                   README.md CHANGELOG.md)))

        (loop for file in expected-files
              do (rove:testing (format nil "~A file should exists" file)
                   (rove:ok (probe-file file))))))))


(deftest test-a-library-has-tests
  (let* ((lib-name "foo-bar")
         (tests-system-name (format nil "~A-tests" lib-name)))
    (with-temp-path (lib-name tmp-path)
      (mystic:render (make-instance '40ants-project-templates/core:library-template)
                     (list :name lib-name
                           :author "Alexander Artemenko")
                     tmp-path)
      (ok (probe-file
           (merge-pathnames (format nil "~A.asd" lib-name)
                            tmp-path)))
      (let* ((asdf:*central-registry* (cons tmp-path
                                            asdf:*central-registry*))
             (rove:*default-reporter* :none))
        (asdf:load-system tests-system-name)
        
        (asdf:test-system lib-name)))))
