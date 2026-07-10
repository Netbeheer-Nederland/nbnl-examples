  # --- cim:Location ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('l_' + pc) }}
    '@type': cim:Location
    cim:Location.mainAddress:
      '@id': urn:uuid:{{ uuid5('sa_' + pc) }}
    cim:Location.PowerSystemResources:
      - urn:uuid:{{ uuid5(pc) }}
    cim:IdentifiedObject.mRID: {{ uuid5('l_' + pc) }}
  # --- cim:StreetAddress -----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('sa_' + pc) }}
    '@type': cim:StreetAddress
    cim:StreetAddress.postalCode: {{ pc }}
