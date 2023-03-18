(defsystem "40ants-project-templates-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/project-templates/"
  :class :package-inferred-system
  :description "Provides tests for 40ants-project-templates."
  :source-control (:git "https://github.com/40ants/project-templates")
  :bug-tracker "https://github.com/40ants/project-templates/issues"
  :pathname "t"
  :depends-on ("40ants-project-templates-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
