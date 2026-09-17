  # --- cim:Contingency (1) ---------------------------------------------------
  {% if dc != 'transparant' %}
  - '@id': urn:uuid:{{ uuid5('cd_' + pt) }}
    '@type': cim:Contingency
    cim:IdentifiedObject.description: {{ pt }}/demand
    cim:IdentifiedObject.mRID: {{ uuid5('cd_' + pt) }}
    cim:IdentifiedObject.name: C1 {{ pt }}
  - '@id': urn:uuid:{{ uuid5('ced_' + pt) }}
    '@type': cim:ContingencyEquipment
    cim:ContingencyEquipment.Equipment:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:ContingencyElement.Contingency:
      '@id': urn:uuid:{{ uuid5('cd_' + pt) }}
    cim:IdentifiedObject.description: {{ pt }}/demand
    cim:IdentifiedObject.mRID: {{ uuid5('ced_' + pt) }}
  {% endif %}
