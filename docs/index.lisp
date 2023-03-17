(uiop:define-package #:40ants-project-templates-docs/index
  (:use #:cl)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax)
  #+quicklisp
  (:import-from #:quicklisp)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection
                #:defsection-copy)
  (:import-from #:40ants-project-templates-docs/changelog
                #:@changelog)
  (:import-from #:docs-config
                #:docs-config)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:40ants-project-templates-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "40ants-project-templates-docs"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "40ants-doc-theme-40ants")
  #-quicklisp
  (asdf:load-system "40ants-doc-theme-40ants")
  
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS")))
  )


(defsection @index (:title "40ants-project-templates"
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "CL"
                                   "API"
                                   "CLI"
                                   "TODO"
                                   "Unlicense"
                                   "REPL"
                                   "GIT"))
  (40ants-project-templates system)
  "
[![](https://github-actions.40ants.com/40ants/project-templates/matrix.svg?only=ci.run-tests)](https://github.com/40ants/project-templates/actions)

![Quicklisp](http://quickdocs.org/badge/40ants-project-templates.svg)
"
  (@installation section)
  (@usage section))


(defsection-copy @readme @index)


(defsection @installation (:title "Installation")
  """
You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :40ants-project-templates)
```
""")


(defsection @usage (:title "Usage"
                    :ignore-words ("ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "40A"))
  "
```
CL-USER> (ql:quickload :40ants-project-templates)

CL-USER> (mystic:list-templates)
(#<40ANTS-PROJECT-TEMPLATES/REBLOCKS-APP:REBLOCKS-APP-TEMPLATE {7010EACC03}>
 #<40ANTS-PROJECT-TEMPLATES/LIBRARY:LIBRARY-TEMPLATE {7010EACC23}>)

CL-USER> (first *)
#<40ANTS-PROJECT-TEMPLATES/REBLOCKS-APP:REBLOCKS-APP-TEMPLATE {7010EACC03}>

CL-USER> (mystic:render *
                        (list :name \"my-web-app\"
                              :author \"John Doe\")
                        #P\"/tmp/my-web-app/\")

```

Optionally, you can give :REQUEST-ALL-OPTIONS-P T argument to force Mystic to ask about all template option including optional.
")
