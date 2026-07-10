  # --- cim:EnergyConsumer ----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(ean + pc + hn) }}
    '@type': cim:EnergyConsumer
    cim:IdentifiedObject.mRID: {{ uuid5(ean + pc + hn) }}
    cim:IdentifiedObject.description: Publieke laadpaal ({{pc }}/{{ hn | replace(' ELP', '') }})
  # --- UsagePoint
  - '@id': urn:uuid:{{ uuid5('up' + ean + pc + hn) }}
    '@type': cim:UsagePoint
    cim:UsagePoint.Equipments:
      - '@id': urn:uuid:{{ uuid5(ean + pc + hn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('up' + ean + pc + hn) }}
    nl:IdentifiedObject.europeanArticleNumberEAN: '{{ ean }}'
  # --- cim:Terminal ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t_' + ean + pc + hn) }}
    '@type': cim:Terminal
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(ean + pc + hn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t_' + ean + pc + hn) }}
