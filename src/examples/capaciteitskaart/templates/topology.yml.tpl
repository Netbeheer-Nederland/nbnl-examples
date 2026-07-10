  # --- cim:TopologicalNode ---------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('tn_' + pc) }}
    '@type': cim:TopologicalNode
    cim:TopologicalNode.Terminal:
      - urn:uuid:{{ uuid5('t2_' + pt) }}
      - urn:uuid:{{ uuid5('t_' + pc) }}
    cim:IdentifiedObject.mRID: {{ uuid5('tn_' + pc) }}
  # --- cim:EnergyConsumer ----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(pc) }}
    '@type': cim:EnergyConsumer
    cim:Equipment.aggregate: true
    cim:IdentifiedObject.mRID: {{ uuid5(pc) }}
    cim:IdentifiedObject.description: {{ pc }}
  # --- cim:Terminal ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t_' + pc) }}
    '@type': cim:Terminal
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(pc) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t_' + pc) }}
