meta:
  id: ktf
  file-extension: ktf
  endian: le
  imports:
    - ../common/net_string
seq:
  - id: magic
    contents: KAEDE!
  - id: version
    type: u4
    valid: 1
  - id: fallback_locale_id
    type: u4
  - id: num_locales
    type: u4
  - id: locales
    type: locale
    repeat: expr
    repeat-expr: num_locales
types:
  locale:
    seq:
      - id: id
        type: u4
      - id: code
        type: net_string
      - id: localised_name
        type: net_string
      - id: num_strings
        type: u4
      - id: strings
        type: locale_string
        repeat: expr
        repeat-expr: num_strings
  locale_string:
    seq:
      - id: name
        type: net_string
      - id: value
        type: net_string