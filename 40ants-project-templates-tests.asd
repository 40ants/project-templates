(defsystem "40ants-project-templates-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/project-templates/"
  :class :package-inferred-system
  :description "Provides tests for 40ants-project-templates."
  :source-control (:git "https://github.com/40ants/project-templates")
  :bug-tracker "https://github.com/40ants/project-templates/issues"
  :pathname "t"
  :serial t
  :depends-on ("40ants-project-templates-tests/core"
               ;; These dependencies are required to be downloaded
               ;; before tests will be started because otherwise
               ;; test will not be able to find these systems during ql:quickload
               "docs-builder"
               "docs-builder/builders/40ants-doc/builder"
               "40ants-ci"
               "40ants-doc-theme-40ants")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
