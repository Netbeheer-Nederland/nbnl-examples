  {% set ss = uuid4() -%}
  {% set pt = uuid4() -%}
  {% set c = uuid4() -%}
  {% set ce = uuid4() -%}
  {% set pte1 = uuid4() -%}
  {% set pte2 = uuid4() -%}
  {% set t_pte1 = uuid4() -%}
  {% set t_pte2 = uuid4() -%}
  {% set vl1 = uuid4() -%}
  {% set vl2 = uuid4() -%}
  {% set cn_vl1 = uuid4() -%}
  {% set cn_vl2 = uuid4() -%}
  {% set ec = uuid4() -%}
  {% set t_ec = uuid4() -%}
  {% set up = uuid4() -%}
  {% set tn = uuid4() -%}
  {% set bm = uuid4() -%}
  {% set l = uuid4() -%}
  {% set sa = uuid4() -%}
  {% set sd = uuid4() -%}
  {% set ap1 = uuid4() -%}
  {% set apl1 = uuid4() -%}
  {% set ap2 = uuid4() -%}
  {% set apl2 = uuid4() -%}
  {% set ols = uuid4() -%}

  # --- cim:Substation --------------------------------------------------------
  - '@id': urn:uuid:{{ ss }}
    '@type': cim:Substation
    cim:Substation.Region:
      '@id': urn:uuid:0a1d2b08-6e92-489b-9161-b3eec2aa479f
    cim:IdentifiedObject.mRID: {{ ss }}
    cim:IdentifiedObject.name: 'SS Station'
  # --- cim:PowerTransformer --------------------------------------------------
  - '@id': urn:uuid:{{ pt }}
    '@type': cim:PowerTransformer
    cim:Equipment.EquipmentContainer:
      '@id': urn:uuid:{{ ss }}
    cim:IdentifiedObject.mRID: {{ pt }}
    cim:IdentifiedObject.name: PT1
  # --- cim:Contingency -------------------------------------------------------
  - '@id': urn:uuid:{{ c }}
    '@type': cim:Contingency
    cim:IdentifiedObject.mRID: {{ c }}
  - '@id': urn:uuid:{{ ce }}
    '@type': cim:ContingencyEquipment
    cim:ContingencyEquipment.Equipment:
      '@id': urn:uuid:{{ pt }}
    cim:ContingencyElement.Contingency:
      '@id': urn:uuid:{{ c }}
    cim:IdentifiedObject.mRID: {{ ce }}
  # --- cim:ActivePowerLimit (1) ----------------------------------------------
  - '@id': urn:uuid:{{ apl1 }}
    '@type': cim:ActivePowerLimit
    cim:ActivePowerLimit.value:
      '@id': urn:uuid:{{ ap1 }}
    cim:OperationalLimit.OperationalLimitSet:
      '@id': urn:uuid:{{ ols }}
    nl:OperationalLimit.positiveFlowIn: false
    cim:IdentifiedObject.mRID: {{ apl1 }}
    cim:IdentifiedObject.name: Aanwezige transportcapaciteit (afname)
  - '@id': urn:uuid:{{ ap1 }}
    '@type': cim:ActivePower
    cim:ActivePower.multiplier:
      '@id': cim:UnitMultiplier.k
    cim:ActivePower.unit:
      '@id': cim:UnitSymbol.W
    cim:ActivePower.value:
      '@value': 630.0
      '@type': xsd:float
  # --- cim:ActivePowerLimit (2) ----------------------------------------------
  - '@id': urn:uuid:{{ apl2 }}
    '@type': cim:ActivePowerLimit
    cim:ActivePowerLimit.value:
      '@id': urn:uuid:{{ ap2 }}
    cim:OperationalLimit.OperationalLimitSet:
      '@id': urn:uuid:{{ ols }}
    nl:OperationalLimit.positiveFlowIn: true
    cim:IdentifiedObject.mRID: {{ apl2 }}
    cim:IdentifiedObject.name: Aanwezige transportcapaciteit (invoeding)
  - '@id': urn:uuid:{{ ap2 }}
    '@type': cim:ActivePower
    cim:ActivePower.multiplier:
      '@id': cim:UnitMultiplier.k
    cim:ActivePower.unit:
      '@id': cim:UnitSymbol.W
    cim:ActivePower.value:
      '@value': 800.0
      '@type': xsd:float
  # --- cim:OperationalLimitSet -----------------------------------------------
  - '@id': urn:uuid:{{ ols }}
    '@type': cim:OperationalLimitSet
    cim:OperationalLimitSet.Equipment:
      '@id': urn:uuid:{{ pt }}
    cim:OperationalLimitSet.Terminal:
      '@id': urn:uuid:{{ t_pte2 }}
    cim:IdentifiedObject.mRID: {{ ols }}
  # --- cim:PowerTransformerEnd (1) -------------------------------------------
  - '@id': urn:uuid:{{ vl1 }}
    '@type': cim:VoltageLevel
    cim:VoltageLevel.BaseVoltage:
      '@id': urn:uuid:45b9413e-a116-4952-8cf8-aeb4b2e53348
    cim:VoltageLevel.Substation:
      '@id': urn:uuid:{{ ss }}
    cim:IdentifiedObject.mRID: {{ vl1 }}
    cim:IdentifiedObject.name: 'VL1 10 kV'
  - '@id': urn:uuid:{{ cn_vl1 }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id': urn:uuid:{{ vl1 }}
    cim:IdentifiedObject.mRID: {{ cn_vl1 }}
  - '@id': urn:uuid:{{ pte1 }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ pt }}
    cim:TransformerEnd.endNumber: 1
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ t_pte1 }}
    cim:IdentifiedObject.mRID: {{ pte1 }}
  - '@id': urn:uuid:{{ t_pte1 }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ cn_vl1 }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ pt }}
    cim:IdentifiedObject.mRID: {{ t_pte1 }}
  # --- cim:PowerTransformerEnd (2) -------------------------------------------
  - '@id': urn:uuid:{{ vl2 }}
    '@type': cim:VoltageLevel
    cim:VoltageLevel.BaseVoltage:
      '@id': urn:uuid:b7482b2f-bcb8-46e9-99b1-e0cd09f3c205
    cim:VoltageLevel.Substation:
      '@id': urn:uuid:{{ ss }}
    cim:IdentifiedObject.mRID: {{ vl2 }}
    cim:IdentifiedObject.name: 'VL2 0.4 kV'
  - '@id': urn:uuid:{{ cn_vl2 }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id': urn:uuid:{{ vl2 }}
    cim:IdentifiedObject.mRID: {{ cn_vl2 }}
  - '@id': urn:uuid:{{ pte2 }}
    '@type': cim:PowerTransformerEnd
    cim:PowerTransformerEnd.PowerTransformer:
      '@id': urn:uuid:{{ pt }}
    cim:TransformerEnd.endNumber: 2
    cim:TransformerEnd.Terminal:
      '@id': urn:uuid:{{ t_pte2 }}
    cim:IdentifiedObject.mRID: {{ pte2 }}
  - '@id': urn:uuid:{{ t_pte2 }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ cn_vl2 }}
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ pt }}
    cim:IdentifiedObject.mRID: {{ t_pte2 }}
  # --- cim:EnergyConsumer ----------------------------------------------------
  - '@id': urn:uuid:{{ ec }}
    '@type': cim:EnergyConsumer
    cim:Equipment.EquipmentContainer:
      '@id': urn:uuid:{{ vl2 }}
    cim:IdentifiedObject.mRID: {{ ec }}
  - '@id': urn:uuid:{{ t_ec }}
    '@type': cim:Terminal
    cim:Terminal.ConductingEquipment:
      '@id': urn:uuid:{{ ec }}
    cim:IdentifiedObject.mRID: {{ t_ec }}
  - '@id': urn:uuid:{{ up }}
    '@type': cim:UsagePoint
    cim:UsagePoint.Equipments:
      - '@id': urn:uuid:{{ ec }}
    cim:IdentifiedObject.mRID: {{ up }}
    nl:IdentifiedObject.europeanArticleNumberEAN: 800012345678901112
  # --- cim:TopologicalNode (OP) ----------------------------------------------
  - '@id': urn:uuid:{{ tn }}
    '@type': cim:TopologicalNode
    cim:TopologicalNode.Terminal:
      - urn:uuid:{{ t_pte2 }}
      - urn:uuid:{{ t_ec }}
    cim:IdentifiedObject.mRID: {{ tn }}
  - '@id': urn:uuid:{{ bm }}
    '@type': cim:BusNameMarker
    cim:BusNameMarker.Terminal:
      - urn:uuid:{{ t_pte2 }}
      - urn:uuid:{{ t_ec }}
    cim:BusNameMarker.TopologicalNode:
      '@id': urn:uuid:{{ tn }}
    cim:IdentifiedObject.mRID: {{ bm }}
    cim:IdentifiedObject.name: PTE-EC
  # --- cim:Location (GL) -----------------------------------------------------
  - '@id': urn:uuid:{{ l }}
    '@type': cim:Location
    cim:Location.mainAddress:
      '@id': urn:uuid:{{ sa }}
    cim:Location.PowerSystemResources:
      - urn:uuid:{{ ec }}
    cim:IdentifiedObject.mRID: {{ l }}
  - '@id': urn:uuid:{{ sa }}
    '@type': cim:StreetAddress
    cim:StreetAddress.postalCode: '1234AB'
    cim:StreetAddress.streetDetail:
      '@id': urn:uuid:{{ sd }}
  - '@id': urn:uuid:{{ sd }}
    '@type': cim:StreetDetail
    cim:StreetDetail.number: '1'
