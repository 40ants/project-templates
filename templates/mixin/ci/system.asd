(defsystem "{{ name }}-ci"
  :author "{{# email }}{{ author }} <{{ email }}>{{/ email }}{{^ email }}{{ author }}{{/ email }}"
  {{# license }}
  :license "{{ license }}"
  {{/ license }}
  {{# homepage }}
  :homepage "{{ homepage }}"
  {{/ homepage }}
  :class :package-inferred-system
  :description "Provides CI settings for {{ name }}."
  {{# github }}
  :source-control (:git "{{ github }}")
  :bug-tracker "{{ github }}/issues"
  {{/ github }}
  :pathname "src"
  :depends-on ("{{ name }}-ci/ci"))
