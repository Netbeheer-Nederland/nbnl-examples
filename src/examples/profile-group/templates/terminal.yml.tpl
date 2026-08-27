  {% set t = uuid4() -%}
  {% set cn = uuid4() -%}
  - '@id': urn:uuid:{{ t }}
    '@type': cim:Terminal
    cim:Terminal.ConnectivityNode:
      '@id': urn:uuid:{{ cn }}
    cim:Terminal.ConductingEquipment:
	  '@id':
    cim:IdentifiedObject.mRID: {{ t }}
  - '@id': urn:uuid:{{ cn }}
    '@type': cim:ConnectivityNode
    cim:ConnectivityNode.ConnectivityNodeContainer:
      '@id':
    cim:IdentifiedObject.mRID: {{ cn }}
