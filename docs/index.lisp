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
  (:import-from #:40ants-project-templates/core
                #:create-reblocks-app
                #:create-library
                #:reblocks-app-template
                #:library-template)
  (:import-from #:40ants-project-templates/mixin/ci
                #:ci-mixin)
  (:import-from #:40ants-project-templates/library
                #:make-system-file
                #:make-core-file)
  (:import-from #:40ants-project-templates/mixin/clpm
                #:clpm-mixin)
  (:import-from #:40ants-project-templates/mixin/docs
                #:docs-mixin)
  (:import-from #:40ants-project-templates/mixin/gitignore
                #:patterns-to-ignore
                #:*patterns*
                #:gitignore-mixin)
  (:import-from #:40ants-project-templates/mixin/qlfile
                #:qlfile-pieces
                #:qlfile-mixin)
  (:import-from #:40ants-project-templates/mixin/rove-tests
                #:rove-tests-mixin)
  (:import-from #:mystic.template.file
                #:file
                #:make-file)
  (:import-from #:40ants-project-templates/utils
                #:ensure-template-docstring-has-options-description)
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
                     (find-package "40ANTS-DOC-THEME-40ANTS"))))


(defsection @index (:title "40ants-project-templates"
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "CL"
                                   "API"
                                   "CLI"
                                   "BSD"
                                   "MIT"
                                   "GPL"
                                   "URL"
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
  (@usage section)
  (@templates section)
  (@mixins section)
  (@utils section))


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
This library provides following template classes:

- LIBRARY-TEMPLATE
- REBLOCKS-APP-TEMPLATE

To create new projects out of these templates, use functions CREATE-LIBRARY and CREATE-REBLOCKS-APP:

```
CL-USER> (40ants-project-templates:create-reblocks-app
          #P\"/tmp/my-web-app/\"
          \"my-web-app\"
          \"My experimental web application\")
```

Optionally, you can give :REQUEST-ALL-OPTIONS-P T argument to force Mystic to ask about all template option including optional.

Also, you can use more generic MYSTIC:RENDER function and pass arguments as a list:

```
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
")


(defsection @templates (:title "Templates")
  (@library section)
  (@reblocks-app section))


(defsection @library (:title "CL Library")
  (library-template class)
  (create-library function)
  (make-core-file generic-function)
  (make-system-file generic-function))


(defsection @reblocks-app (:title "Reblocks Web App")
  (reblocks-app-template class)
  (create-reblocks-app function))


(defsection @mixins (:title "Mixins")
  (@ci section)
  (@clpm section)
  (@docs section)
  (@gitignore section)
  (@qlfile section)
  (@rove-tests section))


(defsection @ci (:title "CI")
  (ci-mixin class))


(defsection @clpm (:title "CLPM")
  (clpm-mixin class))


(defsection @docs (:title "Docs")
  (docs-mixin class))


(defsection @gitignore (:title "Gitignore")
  (gitignore-mixin class)
  (*patterns* variable)
  (patterns-to-ignore generic-function))


(defsection @qlfile (:title "Qlfile")
  (qlfile-mixin class)
  (qlfile-pieces generic-function))


(defsection @rove-tests (:title "Rove Tests")
  (rove-tests-mixin class))


(defsection @utils (:title "Utilities")
  (mystic.template.file:file-mixin class)
  (file class)
  (mystic.template.file:file-content (reader file))
  (mystic.template.file:file-path (reader file))
  (make-file function)
  (ensure-template-docstring-has-options-description function))
