#-asdf3.1 (error "40ants-project-templates requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "40ants-project-templates"
  :description "A bunch of Mystic templates to create CL library, web-project, API microservice and CLI command."
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/project-templates/"
  :source-control (:git "https://github.com/40ants/project-templates")
  :bug-tracker "https://github.com/40ants/project-templates/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :depends-on ("40ants-project-templates/core")
  :in-order-to ((test-op (test-op "40ants-project-templates-tests"))))


(asdf:register-system-packages "mystic-file-mixin" '("MYSTIC.TEMPLATE.FILE"))
(asdf:register-system-packages "mystic-gitignore-mixin" '("MYSTIC.TEMPLATE.GITIGNORE"))
