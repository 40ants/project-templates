(uiop:define-package #:{{name}}-docs/index
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
  (:import-from #:{{name}}-docs/changelog
                #:@changelog)
  (:import-from #:docs-config
                #:docs-config)
  (:import-from #:40ants-doc/autodoc
                #:defautodoc)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:{{name}}-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "{{name}}-docs"))))
  {{# doc-theme }}
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "{{ doc-theme-system }}")
  #-quicklisp
  (asdf:load-system "{{ doc-theme-system }}")
  
  (list :theme
        (find-symbol "{{ doc-theme-symbol }}"
                     (find-package "{{ doc-theme-package }}")))
  {{/ doc-theme }})


(defsection @index (:title "{{name}}{{# description }} - {{ description }}{{/ description }}"
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "TODO"
                                   {{# license}}
                                   "{{ license }}"
                                   {{/ license }}
                                   "REPL"
                                   "ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "40A"
                                   "API"
                                   "URL"
                                   "URI"
                                   "RPC"
                                   "GIT"))
  ({{name}} system)
  "
{{# github }}
[![](https://github-actions.40ants.com/{{ github-user }}/{{ github-repo }}/matrix.svg?only=ci.run-tests)]({{ github }}/actions)

{{/ github }}
![Quicklisp](http://quickdocs.org/badge/{{name}}.svg)
"
  (@installation section)
  (@usage section)
  (@api section))


(defsection-copy @readme @index)


(defsection @installation (:title "Installation")
  """
You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :{{name}})
```
""")


(defsection @usage (:title "Usage")
  "
TODO: Write a library description. Put some examples here.
")


(defautodoc @api (:system "{{name}}"))
