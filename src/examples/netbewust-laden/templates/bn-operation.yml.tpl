  {% set an = uuid4() -%}
  {% set av = uuid4() -%}
  # --- cim:Analog ------------------------------------------------------------
  - '@id': urn:uuid:{{ an }}
    '@type': cim:Analog
    cim:Analog.positiveFlowIn: false
    cim:Measurement.unitMultiplier:
      '@id': cim:UnitMultiplier.k
    cim:Measurement.unitSymbol:
      '@id': cim:UnitSymbol.W
    cim:Measurement.Terminal: urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:Measurement.PowerSystemResource: urn:uuid:{{ uuid5(pt) }}
    cim:IdentifiedObject.mRID: {{ an }}
    cim:IdentifiedObject.description: {{ pt }}
  # --- cim:AnalogValue -------------------------------------------------------
  - '@id': urn:uuid:{{ av }}
    '@type': cim:AnalogValue
    cim:AnalogValue.value:
      '@value': {{ v }}
      '@type': xsd:float
    cim:AnalogValue.Analog:
      '@id': urn:uuid:{{ an }}
    cim:MeasurementValue.timeStamp:
      '@value': '{{ ts | xsd_datetime }}'
      '@type': xsd:dateTime
    cim:IdentifiedObject.mRID: {{ av }}
