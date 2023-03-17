(defsystem "40ants-project-templates-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/project-templates/"
  :class :package-inferred-system
  :description "Provides documentation for 40ants-project-templates."
  :source-control (:git "https://github.com/40ants/project-templates")
  :bug-tracker "https://github.com/40ants/project-templates/issues"
  :pathname "docs"
  :depends-on ("40ants-project-templates"
               "40ants-project-templates-docs/index"))
