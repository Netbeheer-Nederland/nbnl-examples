  # --- nl:Queue (1) ----------------------------------------------------------
  {% if rq and dap and gtc %}
  - '@id': urn:uuid:{{ uuid5('q_' + pt) }}
    '@type': nl:Queue
    nl:Queue.requests: {{ rq | int }}
    nl:Queue.capacity:
      '@id': urn:uuid:{{ uuid5('qap_' + pt) }}
    nl:Queue.ReportingGroup:
      - urn:uuid:{{ uuid5('rg_' + pt) }}
    nl:Queue.positiveFlowIn: true
    cim:IdentifiedObject.description: Afname {{ pt }}
    cim:IdentifiedObject.mRID: {{ uuid5('q_' + pt) }}
  - '@id': urn:uuid:{{ uuid5('qap_' + pt) }}
    '@type': cim:ActivePower
    cim:ActivePower.multiplier:
      '@id': cim:UnitMultiplier.M
    cim:ActivePower.unit:
      '@id': cim:UnitSymbol.W
    cim:ActivePower.value:
      '@value': {{ dap }}
      '@type': xsd:float
  # --- cim:Analog ------------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('gtc_' + pt) }}
    '@type': cim:Analog
    cim:Analog.positiveFlowIn: true
    cim:Measurement.measurementType:
      '@id': nl:MeasurementKind.gevraagdeTransportcapaciteit
    cim:Measurement.unitMultiplier:
      '@id': cim:UnitMultiplier.M
    cim:Measurement.unitSymbol:
      '@id': cim:UnitSymbol.W
    cim:Measurement.Terminal:
      - urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:Measurement.PowerSystemResource:
      - urn:uuid:{{ uuid5(pt) }}
    cim:IdentifiedObject.description: Afname {{ pt }}
    cim:IdentifiedObject.mRID: {{ uuid5('gtc_' + pt) }}
  - '@id': urn:uuid:{{ uuid5('gtcav_' + pt) }}
    '@type': cim:AnalogValue
    cim:AnalogValue.value:
      '@value': {{ gtc }}
      '@type': xsd:float
    cim:AnalogValue.Analog:
      '@id': urn:uuid:{{ uuid5('gtc_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('gtcav_' + pt) }}
    {% endif %}
