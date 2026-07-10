  # --- cim:TopologicalNode ---------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('tn_' + ean + pc + hn + pt) }}
    '@type': cim:TopologicalNode
    cim:TopologicalNode.Terminal:
      - urn:uuid:{{ uuid5('t2_' + pt) }}
      - urn:uuid:{{ uuid5('t_' + ean + pc + hn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('tn_' + ean + pc + hn + pt) }}
