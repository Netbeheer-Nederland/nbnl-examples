  # --- cim:PowerTransformer --------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(pt) }}
    '@type': cim:PowerTransformer
    cim:Equipment.EquipmentContainer:
      '@id': urn:uuid:{{ uuid5(ssn) }}
    cim:IdentifiedObject.mRID: {{ uuid5(pt) }}
    cim:IdentifiedObject.name: {{ pt }}
  # --- cim:PowerTransformerEnd (1) -------------------------------------------
  - '@id': urn:uuid:{{ uuid5('pte1_' + pt) }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:TransformerEnd.endNumber: 1
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ uuid5('t1_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('pte1_' + pt) }}
  # --- cim:Terminal (1) ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t1_' + pt) }}
    '@type': cim:Terminal
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t1_' + pt) }}
  # --- cim:PowerTransformerEnd (2) -------------------------------------------
  - '@id': urn:uuid:{{ uuid5('pte2_' + pt) }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:TransformerEnd.endNumber: 2
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('pte2_' + pt) }}
  # --- cim:VoltageLevel (2) --------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('vl2_' + pt) }}
    '@type': cim:VoltageLevel
    cim:VoltageLevel.BaseVoltage:
      '@id': urn:uuid:45b9413e-a116-4952-8cf8-aeb4b2e53348
    cim:VoltageLevel.Substation:
      '@id': urn:uuid:{{ uuid5(ssn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('vl2_' + pt) }}
  # --- cim:ConnectivityNode (2) ----------------------------------------------
  - '@id': urn:uuid:{{ uuid5('cn2_' + pt) }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id': urn:uuid:{{ uuid5('vl2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('cn2_' + pt) }}
  # --- cim:Terminal (2) ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t2_' + pt) }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ uuid5('cn2_' + pt) }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('t2_' + pt) }}
  # --- cim:ReportingGroup ----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('rg_' + pt) }}
    '@type': cim:ReportingGroup
    cim:IdentifiedObject.description: {{ pt }}
    cim:IdentifiedObject.mRID: {{ uuid5('rg_' + pt) }}
  {% if dc %}
  # --- cim:ActivePowerLimit (1) ----------------------------------------------
  - '@id': urn:uuid:{{ uuid5('apld_' + pt) }}
    '@type': cim:ActivePowerLimit
    cim:ActivePowerLimit.value:
      '@id': urn:uuid:{{ uuid5('apd_' + pt) }}
    cim:OperationalLimit.OperationalLimitSet:
      '@id': urn:uuid:{{ uuid5('ols_' + pt) }}
    cim:IdentifiedObject.description: Aanwezige transportcapaciteit (afname)
    cim:IdentifiedObject.mRID: {{ uuid5('apld_' + pt) }}
    nl:OperationalLimit.positiveFlowIn: true
  - '@id': urn:uuid:{{ uuid5('apd_' + pt) }}
    '@type': cim:ActivePower
    cim:ActivePower.multiplier:
      '@id': cim:UnitMultiplier.M
    cim:ActivePower.unit:
      '@id': cim:UnitSymbol.W
    cim:ActivePower.value:
      '@value': {{ dc }}
      '@type': xsd:float
  {% endif %}
  {% if gc %}
  # --- cim:ActivePowerLimit (2) ----------------------------------------------
  - '@id': urn:uuid:{{ uuid5('aplg_' + pt) }}
    '@type': cim:ActivePowerLimit
    cim:ActivePowerLimit.value:
      '@id': urn:uuid:{{ uuid5('apg_' + pt) }}
    cim:OperationalLimit.OperationalLimitSet:
      '@id': urn:uuid:{{ uuid5('ols_' + pt) }}
    cim:IdentifiedObject.description: Aanwezige transportcapaciteit (invoeding)
    cim:IdentifiedObject.mRID: {{ uuid5('aplg_' + pt) }}
    nl:OperationalLimit.positiveFlowIn: false
  - '@id': urn:uuid:{{ uuid5('apg_' + pt) }}
    '@type': cim:ActivePower
    cim:ActivePower.multiplier:
      '@id': cim:UnitMultiplier.M
    cim:ActivePower.unit:
      '@id': cim:UnitSymbol.W
    cim:ActivePower.value:
      '@value': {{ gc }}
      '@type': xsd:float
  {% endif %}
  # --- cim:OperationalLimitSet ----------------------------------------------
  - '@id': urn:uuid:{{ uuid5('ols_' + pt) }}
    '@type': cim:OperationalLimitSet
    cim:OperationalLimitSet.Equipment:
      '@id': urn:uuid:{{ uuid5(pt) }}
    cim:OperationalLimitSet.Terminal:
      '@id': urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('ols_' + pt) }}
