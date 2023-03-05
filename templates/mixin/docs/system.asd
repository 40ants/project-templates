(defsystem "{{ name }}-docs"
  :author "{{# email }}{{ author }} <{{ email }}>{{/ email }}{{^ email }}{{ author }}{{/ email }}"
  {{# license }}
  :license "{{ license }}"
  {{/ license }}
  {{# homepage }}
  :homepage "{{ homepage }}"
  {{/ homepage }}
  :class :package-inferred-system
  :description "Provides documentation for {{ name }}."
  {{# github }}
  :source-control (:git "{{ github }}")
  :bug-tracker "{{ github }}/issues"
  {{/ github }}
  :pathname "docs"
  :depends-on ("{{ name }}"
               "{{ name }}-docs/index"))
