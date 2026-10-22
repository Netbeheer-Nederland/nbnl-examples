  {% set pt = 'pt_' + ssn + '_' + pt -%}
  # --- cim:TopologicalNode (PTE-EC) ------------------------------------------
  - '@id': urn:uuid:{{ uuid5('tn_' + ean + pc + hn + ssn + pt) }}
    '@type': cim:TopologicalNode
    cim:TopologicalNode.Terminal:
      - urn:uuid:{{ uuid5('t_' + ean + pc + hn) }}
      - urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('tn_' + ean + pc + hn + pt) }}
  # --- cim:BusNameMarker (PTE-EC) --------------------------------------------
  - '@id': urn:uuid:{{ uuid5('bnm_' + ean + pc + hn + ssn + pt) }}
    '@type': cim:BusNameMarker
    cim:BusNameMarker.Terminal:
      - urn:uuid:{{ uuid5('t_' + ean + pc + hn) }}
      - urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:BusNameMarker.TopologicalNode:
      '@id': urn:uuid:{{ uuid5('tn_' + ean + pc + hn + ssn + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('bnm_' + ean + pc + hn + ssn + pt) }}
    cim:IdentifiedObject.name: PTE-EC
