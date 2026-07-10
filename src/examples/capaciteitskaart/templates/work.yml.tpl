  {% set w = uuid4() -%}
  {% set wt = uuid4() -%}
  {% set ts = uuid4() -%}
  {% set dt = uuid4() -%}
  # --- cim:WorkTask ----------------------------------------------------------
  - '@id': urn:uuid:{{ wt }}
    '@type': cim:WorkTask
    cim:WorkTask.Assets:
      - '@id': urn:uuid:{{ uuid5('as_' + pt) }}
    cim:WorkTask.Work:
      '@id': urn:uuid:{{ w }}
    cim:IdentifiedObject.mRID: {{ wt }}
  # --- cim:Work --------------------------------------------------------------
  - '@id': urn:uuid:{{ w }}
    '@type': cim:Work
    nl:Work.source: {{ source }}
    {% if status %}
    cim:BaseWork.statusKind:
      '@id': cim:WorkStatusKind.{{ status }}
    {% endif %}
    {% if year %}
    cim:BaseWork.TimeSchedules:
      - '@id': urn:uuid:{{ ts }}
    {% endif %}
    cim:IdentifiedObject.description: {{ proj }}
    cim:IdentifiedObject.mRID: 7bdde4a9-2022-41a3-87b0-35c011e102c9
  {% if year %}
  - '@id': urn:uuid:{{ ts }}
    '@type': cim:WorkTimeSchedule
    cim:TimeSchedule.scheduleInterval:
      '@id': urn:uuid:{{ dt }}
    cim:IdentifiedObject.mRID: {{ ts }}
  - '@id': urn:uuid:{{ dt }}
    '@type': cim:DateTimeInterval
    cim:DateTimeInterval.end:
      '@value': '{{ year }}-01-01'
      '@type': xsd:date
  {% endif %}
