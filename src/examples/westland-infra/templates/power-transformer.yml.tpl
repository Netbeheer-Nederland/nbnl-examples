  {% set pt = 'pt_' + ssn + pt -%}
  # --- cim:PowerTransformer --------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(pt) }}
    '@type': cim:PowerTransformer
    cim:Equipment.EquipmentContainer:
      '@id': urn:uuid:{{ uuid5(ssn) }}
    cim:IdentifiedObject.mRID: {{ uuid5(pt) }}
    cim:IdentifiedObject.name: "{{ pt }}"
  # --- cim:PowerTransformerEnd (1) -------------------------------------------
  - '@id': urn:uuid:{{ uuid5('pte1_' + pt) }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:TransformerEnd.endNumber: 1
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ uuid5('t1_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('pte1_' + pt) }}
  # --- cim:Terminal (1) ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t1_' + pt) }}
    '@type': cim:Terminal
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t1_' + pt) }}
  # --- cim:PowerTransformerEnd (2) -------------------------------------------
  - '@id': urn:uuid:{{ uuid5('pte2_' + pt) }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:TransformerEnd.endNumber: 2
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('pte2_' + pt) }}
  # --- cim:VoltageLevel (2) --------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('vl2_' + pt) }}
    '@type': cim:VoltageLevel
    cim:VoltageLevel.BaseVoltage:
    {% if pte2 == "0.4" %}
      '@id': urn:uuid:b7482b2f-bcb8-46e9-99b1-e0cd09f3c205
    {% elif pte2 == "10" %}
      '@id': urn:uuid:45b9413e-a116-4952-8cf8-aeb4b2e53348
    {% elif pte2 == "20" %}
      '@id': urn:uuid:4ace87c9-16c7-4097-914f-d4551d7d8cd5
    {% elif pte2 == "25" %}
      '@id': urn:uuid:d5445f84-09ac-4647-b6b2-ed81cc5ab76b
    {% endif %}
    cim:VoltageLevel.Substation:
      '@id': urn:uuid:{{ uuid5(ssn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('vl2_' + pt) }}
  # --- cim:ConnectivityNode (2) ----------------------------------------------
  - '@id': urn:uuid:{{ uuid5('cn2_' + pt) }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id': urn:uuid:{{ uuid5('vl2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('cn2_' + pt) }}
  # --- cim:Terminal (2) ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t2_' + pt) }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ uuid5('cn2_' + pt) }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t2_' + pt) }}
