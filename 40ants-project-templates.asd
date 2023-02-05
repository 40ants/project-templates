(defsystem "40ants-project-templates"
    :description "A bunch of Mystic templates to create CL library, web-project, API microservice and CLI command."
    :author "Alexander Artemenko"
    :license "BSD"
    :source-control (:git "https://github.com/40ants/40ants-project-templates")
    :bug-tracker "https://github.com/40ants/40ants-project-templates/issues"
    :class :40ants-asdf-system
    :defsystem-depends-on ("40ants-asdf-system")
    :pathname "src"
    :depends-on ("40ants-project-templates/core")
    :in-order-to ((test-op (test-op "40ants-asdf-system-tests"))))


(asdf:register-system-packages "mystic-file-mixin" '("MYSTIC.TEMPLATE.FILE"))
(asdf:register-system-packages "mystic-gitignore-mixin" '("MYSTIC.TEMPLATE.GITIGNORE"))
