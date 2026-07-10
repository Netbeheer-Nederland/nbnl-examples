  # --- cim:Substation --------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5(ssn) }}
    '@type': cim:Substation
    cim:Substation.Region:
      '@id': urn:uuid:4f74c8e2-adb5-4815-9607-eb00fb6a0d55
    cim:IdentifiedObject.mRID: {{ uuid5(ssn) }}
    cim:IdentifiedObject.name: {{ ssn }}
