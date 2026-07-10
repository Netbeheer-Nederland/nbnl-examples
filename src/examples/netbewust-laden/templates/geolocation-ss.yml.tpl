  # --- cim:Location ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('l_' + ssn) }}
    '@type': cim:Location
    cim:Location.CoordinateSystem:
      '@id': urn:uuid:8dabcb33-6555-4ad8-a7ba-f1fb162ae98c
    cim:Location.mainAddress:
      '@id': urn:uuid:{{ uuid5('sa_' + ssn) }}
    cim:Location.PowerSystemResources:
      - urn:uuid:{{ uuid5(ssn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('l_' + ssn) }}
    cim:IdentifiedObject.name: {{ ssn }}
  # --- cim:StreetAddress -----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('sa_' + ssn) }}
    '@type': cim:StreetAddress
    cim:StreetAddress.postalCode: {{ pc }}
    cim:StreetAddress.streetDetail:
      '@id': urn:uuid:{{ uuid5('sd_' + ssn) }}
  # --- cim:StreetDetail ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('sd_' + ssn) }}
    '@type': cim:StreetDetail
    cim:StreetDetail.number: "{{ hn }}"
  - '@id': urn:uuid:{{ uuid5('pp_' + ssn) }}
    '@type': cim:PositionPoint
    cim:PositionPoint.xPosition: "{{ x_pos }}"
    cim:PositionPoint.yPosition: "{{ y_pos }}"
    cim:PositionPoint.Location:
      '@id': urn:uuid:{{ uuid5('l_' + ssn) }}
