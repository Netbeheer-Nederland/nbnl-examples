  # --- cim:Substation --------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('ss_' + pt) }}
    '@type': cim:Substation
    cim:Substation.Region:
      '@id': urn:uuid:4f74c8e2-adb5-4815-9607-eb00fb6a0d55
    cim:IdentifiedObject.mRID: {{ uuid5('ss_' + pt) }}
    cim:IdentifiedObject.name: {{ ssn }}
  # --- cim:PowerTransformer --------------------------------------------------
  - '@id': urn:uuid:{{ pt }}
    '@type': cim:PowerTransformer
    cim:Equipment.EquipmentContainer:
      '@id': urn:uuid:{{ uuid5('ss_' + pt) }}
    cim:IdentifiedObject.mRID: {{ pt }}
  # --- cim:PowerTransformerEnd (1) -------------------------------------------
  - '@id': urn:uuid:{{ uuid5('pte1_' + pt) }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ pt }}
    cim:TransformerEnd.endNumber: 1
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ uuid5('t1_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('pte1_' + pt) }}
  # --- cim:VoltageLevel (1) --------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('vl1_' + pt) }}
    '@type': cim:VoltageLevel
    cim:VoltageLevel.BaseVoltage:
      '@id': urn:uuid:45b9413e-a116-4952-8cf8-aeb4b2e53348
    cim:VoltageLevel.Substation:
      '@id': urn:uuid:{{ uuid5('ss_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('vl1_' + pt) }}
  # --- cim:ConnectivityNode (1) ----------------------------------------------
  - '@id': urn:uuid:{{ uuid5('cn1_' + pt) }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id': urn:uuid:{{ uuid5('vl1_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('cn1_' + pt) }}
  # --- cim:Terminal (1) ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('t1_' + pt) }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ uuid5('cn1_' + pt) }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ pt }}
    cim:IdentifiedObject.mRID: {{ uuid5('t1_' + pt) }}
  # --- cim:PowerTransformerEnd (2) -------------------------------------------
  - '@id': urn:uuid:{{ uuid5('pte2_' + pt) }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ pt }}
    cim:TransformerEnd.endNumber: 2
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('pte2_' + pt) }}
  # --- cim:VoltageLevel (2) --------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('vl2_' + pt) }}
    '@type': cim:VoltageLevel
    cim:VoltageLevel.BaseVoltage:
      '@id': urn:uuid:b7482b2f-bcb8-46e9-99b1-e0cd09f3c205
    cim:VoltageLevel.Substation:
      '@id': urn:uuid:{{ uuid5('ss_' + pt) }}
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
      '@id': urn:uuid:{{ pt }}
    cim:IdentifiedObject.mRID: {{ uuid5('t2_' + pt) }}
  # --- cim:ActivePowerLimit --------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('apl_' + pt) }}
    '@type': cim:ActivePowerLimit
    cim:ActivePowerLimit.value:
      '@id': urn:uuid:{{ uuid5('ap_' + pt) }}
    cim:OperationalLimit.OperationalLimitSet:
      '@id': urn:uuid:{{ uuid5('ols_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('apl_' + pt) }}
  # --- cim:ActivePower
  - '@id': urn:uuid:{{ uuid5('ap_' + pt) }}
    '@type': cim:ActivePower
    cim:ActivePower.multiplier:
      '@id': cim:UnitMultiplier.k
    cim:ActivePower.unit:
      '@id': cim:UnitSymbol.W
    cim:ActivePower.value:
      '@value': {{ c }}.0
      '@type': xsd:float
  # --- cim: OperationalLimitSet ----------------------------------------------
  - '@id': urn:uuid:{{ uuid5('ols_' + pt) }}
    '@type': cim:OperationalLimitSet
    cim:OperationalLimitSet.Equipment:
      '@id': urn:uuid:{{ pt }}
    cim:OperationalLimitSet.Terminal:
      '@id': urn:uuid:{{ uuid5('t2_' + pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('ols_' + pt) }}
