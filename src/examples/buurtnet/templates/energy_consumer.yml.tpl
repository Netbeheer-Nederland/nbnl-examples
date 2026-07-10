  # --- cim:EnergyConsumer ----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(pc + hn) }}
    '@type': cim:EnergyConsumer
    cim:IdentifiedObject.mRID: {{ uuid5(pc + hn) }}
  # --- cim:Terminal ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t_' + pc + hn) }}
    '@type': cim:Terminal
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(pc + hn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t_' + pc + hn) }}
