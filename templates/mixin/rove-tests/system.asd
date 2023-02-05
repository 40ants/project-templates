(defsystem "{{ name }}-tests"
  :author "{{# email }}{{ author }} <{{ email }}>{{/ email }}{{^ email }}{{ author }}{{/ email }}"
  {{# license }}
  :license "{{ license }}"
  {{/ license }}
  :class :package-inferred-system
  :description "Provides tests for {{ name }}."
  {{# github }}
  :source-control (:git "{{ github }}")
  :bug-tracker "{{ github }}/issues"
  {{/ github }}
  :pathname "t"
  :depends-on ("{{ name }}-tests/core")
  :perform (test-op :after (op c)
                    (symbol-call :rove :run c))  )
