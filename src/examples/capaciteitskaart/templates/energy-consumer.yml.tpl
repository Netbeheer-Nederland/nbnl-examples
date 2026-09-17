  # --- cim:EnergyConsumer ----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(pc) }}
    '@type': cim:EnergyConsumer
    cim:Equipment.aggregate: true
    cim:Equipment.EquipmentContainer:
      '@id': urn:uuid:{{ uuid5('vl2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5(pc) }}
    cim:IdentifiedObject.name: {{ pc }}/VL2 {{ pt }}
  # --- cim:Terminal ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t_' + pc) }}
    '@type': cim:Terminal
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(pc) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t_' + pc) }}
