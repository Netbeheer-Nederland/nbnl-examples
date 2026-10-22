  # --- cim:Substation --------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(ssn) }}
    '@type': cim:Substation
    cim:Substation.Region:
      '@id': urn:uuid:21ba2c21-33a7-487d-9618-789334963e62
    cim:IdentifiedObject.mRID: {{ uuid5(ssn) }}
    cim:IdentifiedObject.name: "{{ ssn }}"
