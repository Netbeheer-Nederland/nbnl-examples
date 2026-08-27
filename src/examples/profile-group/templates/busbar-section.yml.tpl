  {% set bay = uuid4() -%}
  {% set bbs = uuid4() -%}
  {% set cn = uuid4() -%}
  {% set cn_bay = uuid4() -%}
  {% set switch = uuid4() -%}
  {% set t_bbs = uuid4() -%}
  {% set t_switch_bay = uuid4() -%}
  {% set t_switch_cn = uuid4() -%}
  # --- cim:Bay ---------------------------------------------------------------
  - '@id': urn:uuid:{{ bay }}
    '@type': cim:Bay
    cim:Bay.VoltageLevel:
      '@id': {{ vl }}
    cim:IdentifiedObject.mRID: {{ bay }}
  - '@id': urn:uuid:{{ cn_bay }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id': urn:uuid:{{ bay }}
    cim:IdentifiedObject.mRID: {{ cn_bay }}
  # --- cim:BusbarSection -----------------------------------------------------
  - '@id': urn:uuid:{{ cn }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id': {{ vl }}
    cim:IdentifiedObject.mRID: {{ cn }}
  - '@id': urn:uuid:{{ bbs }}
    '@type': cim:BusbarSection
    cim:Equipment.EquipmentContainer:
      '@id': {{ vl }}
    cim:IdentifiedObject.mRID: {{ bbs }}
  - '@id': urn:uuid:{{ t_bbs }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ cn }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ bbs }}
    cim:IdentifiedObject.mRID: {{ t_bbs }}
  # --- cim:Switch ------------------------------------------------------------
  - '@id': urn:uuid:{{ t_switch_bay }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ cn_bay }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ switch }}
    cim:IdentifiedObject.mRID: {{ t_switch_bay }}
  - '@id': urn:uuid:{{ switch }}
    '@type': cim:Switch
    cim:Switch.normalOpen: false
    cim:Equipment.EquipmentContainer:
      '@id': urn:uuid:{{ bay }}
    cim:IdentifiedObject.mRID: {{ switch }}
  - '@id': urn:uuid:{{ t_switch_cn }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ cn }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ switch }}
    cim:IdentifiedObject.mRID: {{ t_switch_cn }}
