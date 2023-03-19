(defsystem "{{name}}-tests"
  :author "{{#email}}{{author}} <{{email}}>{{/email}}{{^email}}{{author}}{{/email}}"
  {{#license}}
  :license "{{license}}"
  {{/license}}
  {{#homepage}}
  :homepage "{{homepage}}"
  {{/homepage}}
  :class :package-inferred-system
  :description "Provides tests for {{name}}."
  {{#github}}
  :source-control (:git "{{github}}")
  :bug-tracker "{{github}}/issues"
  {{/github}}
  :pathname "t"
  :depends-on ("{{name}}-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
