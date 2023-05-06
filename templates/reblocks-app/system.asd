#-asdf3.1 (error "{{name}} requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "{{name}}"
  {{#description}}
  :description "{{description}}"
  {{/description}}
  :author "{{#email}}{{author}} <{{email}}>{{/email}}{{^email}}{{author}}{{/email}}"
  {{#license}}
  :license "{{license}}"
  {{/license}}
  {{#homepage}}
  :homepage "{{homepage}}"
  {{/homepage}}
  {{#github}}
  :source-control (:git "{{github}}")
  :bug-tracker "{{github}}/issues"
  {{/github}}
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :depends-on ("reblocks"
               "clack-handler-hunchentoot"
               "{{name}}/server")
  :in-order-to ((test-op (test-op "{{name}}-tests"))))


(register-system-packages "clack-handler-hunchentoot" '(#:clack.handler.hunchentoot))
