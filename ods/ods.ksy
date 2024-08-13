meta:
  id: ods
  file-extension: ods
  endian: le
  imports:
    - ../common/net_string
seq:
  - id: magic
    contents: ODS
  - id: file_version
    type: u1
  - id: title
    type: net_string
  - id: artist
    type: net_string
  - id: creator
    type: net_string
  - id: version
    type: net_string
  - id: audio_filename
    type: net_string
  - id: drain_rate
    type: u1
  - id: circle_size
    type: u1
  - id: overall_difficulty
    type: u1
  - id: slider_multiplier
    type: f4
  - id: slider_tick_rate
    type: f4
  - id: unknown
    type: f4
  - id: peppy_stars
    type: u1
  - id: eyup_stars
    type: f4
  - id: timing_points_count
    type: vlq_base128_le
  - id: timing_points
    type: timing_point
    repeat: expr
    repeat-expr: timing_points_count.value
  - id: break_count
    type: vlq_base128_le
  - id: breaks
    type: break
    repeat: expr
    repeat-expr: break_count.value
  - id: hit_object_count
    type: vlq_base128_le
  - id: hit_objects
    type: hit_object
    repeat: expr
    repeat-expr: hit_object_count.value
  
types:
  timing_point:
    seq:
      - id: offset
        type: u4
      - id: beat_length
        type: f4
      - id: sampleset
        type: u1
        
  break:
    seq:
      - id: start
        type: u4
      - id: end
        type: u4
        
  hit_object:
    seq:
      - id: start
        type: u4
      - id: type
        type: u1
      - id: position
        type: short_vector_2
      - id: hitsound
        type: u1
      - id: end
        type: u4
        if: type & 8 > 0
      - id: slider
        type: slider
        if: type & 2 > 0
        
  short_vector_2:
    seq:
      - id: x
        type: u2
      - id: y
        type: u2
        
  slider:
    seq:
      - id: repeats
        type: u2
      - id: spatial_length
        type: u4
      - id: sliderpoints_count
        type: vlq_base128_le
      - id: sliderpoints
        type: sliderpoint
        repeat: expr
        repeat-expr: sliderpoints_count.value
      - id: ticks_count
        type: vlq_base128_le
      - id: ticks
        type: short_vector_2
        repeat: expr
        repeat-expr: ticks_count.value
  
  sliderpoint:
    seq:
      - id: x
        type: u2
      - id: y
        type: u2
      - id: angle
        doc: "This is useless OOTB, you need to do some extra parsing to make this meaningful"
        type: u4