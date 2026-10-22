  {% set pt = 'pt_' + ssn + pt -%}
  # --- cim:TopologicalNode ---------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('tn_' + ean + pc + hn + ssn + pt) }}
    '@type': cim:TopologicalNode
    cim:TopologicalNode.Terminal:
      - urn:uuid:{{ uuid5('t_' + ean + pc + hn) }}
      - urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('tn_' + ean + pc + hn + pt) }}
