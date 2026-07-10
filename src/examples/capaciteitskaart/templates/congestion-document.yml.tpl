  {% set ea = uuid4() -%}
  {% if dc != 'transparant' %}
  # --- nl:CongestionDocument -------------------------------------------------
  - '@id': urn:uuid:{{ ea }}
    '@type': cim:ElectronicAddress
    cim:ElectronicAddress.web: 'https://www.liander.nl/grootzakelijk/capaciteit-op-het-net/congestieonderzoeken'
  - '@id': urn:uuid:{{ uuid5('cod_' + pt) }}
    '@type': nl:CongestionDocument
    nl:CongestionDocument.Contingency:
      - urn:uuid:{{ uuid5('cd_' + pt) }}
    nl:CongestionDocument.constraint:
      '@id': nl:RAGKind.{{ dc }}
    nl:CongestionDocument.positiveFlowIn: true
    {% if year %}
    nl:CongestionDocument.alleviationYear: {{ year }}
    {% endif %}
    cim:Document.electronicAddress:
      '@id': urn:uuid:{{ ea }}
    cim:IdentifiedObject.description: {{ pt }}/demand
    cim:IdentifiedObject.mRID: {{ uuid5('cod_' + pt) }}
  {% endif %}
