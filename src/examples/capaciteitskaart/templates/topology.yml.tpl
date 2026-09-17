  # --- cim:TopologicalNode ---------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('tn_' + pc) }}
    '@type': cim:TopologicalNode
    cim:TopologicalNode.Terminal:
      - urn:uuid:{{ uuid5('t2_' + pt) }}
      - urn:uuid:{{ uuid5('t_' + pc) }}
    cim:IdentifiedObject.mRID: {{ uuid5('tn_' + pc) }}
  # --- cim:BusNameMarker (PTE/EC) ---------------------------------------------
  - '@id': urn:uuid:{{ uuid5('bnm_' + pc) }}
    '@type': cim:BusNameMarker
    cim:BusNameMarker.Terminal:
      - urn:uuid:{{ uuid5('t2_' + pt) }}
      - urn:uuid:{{ uuid5('t_' + pc) }}
    cim:BusNameMarker.TopologicalNode:
      '@id': urn:uuid:{{ uuid5('tn_' + pc) }}
    cim:IdentifiedObject.mRID: {{ uuid5('bnm_' + pc) }}
    cim:IdentifiedObject.name: 'PTE-EC'
