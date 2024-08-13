meta:
  id: net_string
  endian: le
  imports:
    - /common/vlq_base128_le
types:
  net_string:
      seq:
        - id: length
          type: vlq_base128_le
        - id: value
          type: str
          encoding: 'utf-8'
          size: length.value