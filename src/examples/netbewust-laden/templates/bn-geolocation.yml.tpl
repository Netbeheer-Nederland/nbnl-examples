  # --- cim:Location ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('l_' + pc + hn) }}
    '@type': cim:Location
    cim:Location.mainAddress:
      '@id': urn:uuid:{{ uuid5('sa_' + pc + hn) }}
    cim:Location.PowerSystemResources:
      - urn:uuid:{{ uuid5(pc + hn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('l_' + pc + hn) }}
  # --- cim:StreetAddress -----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('sa_' + pc + hn) }}
    '@type': cim:StreetAddress
    cim:StreetAddress.postalCode: {{ pc }}
    cim:StreetAddress.streetDetail:
      '@id': urn:uuid:{{ uuid5('sd_' + pc + hn) }}
  # --- cim:StreetDetail ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('sd_' + pc + hn) }}
    '@type': cim:StreetDetail
    cim:StreetDetail.number: "{{ hn }}"
