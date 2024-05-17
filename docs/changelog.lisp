(uiop:define-package #:40ants-project-templates-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:40ants-project-templates-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "API"
                              "JSON-RPC"
                              "HTTP"))
  (0.4.0 2024-05-18
         "* Update dependencies. Renamed asd files to prevent qlot from trying to process dependencies from these files.")
  (0.3.0 2023-05-06
         "* Add API section into the docs.
          * Add dependency on `clack-handler-hunchentoot` system.")
  (0.2.0 2023-05-01
         "* Added a template for JSON-RPC API server.")
  (0.1.0 2023-02-05
         "* Initial version."))
