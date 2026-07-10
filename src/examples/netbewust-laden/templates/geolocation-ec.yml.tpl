  # --- cim:Location ----------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('l_' + ean + pc + hn) }}
    '@type': cim:Location
    cim:Location.CoordinateSystem:
      '@id': urn:uuid:8dabcb33-6555-4ad8-a7ba-f1fb162ae98c
    cim:Location.mainAddress:
      '@id': urn:uuid:{{ uuid5('sa_' + ean + pc + hn) }}
    cim:Location.PowerSystemResources:
      - urn:uuid:{{ uuid5(ean + pc + hn) }}
    cim:IdentifiedObject.mRID: {{ uuid5('l_' + ean + pc + hn) }}
  # --- cim:StreetAddress -----------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('sa_' + ean + pc + hn) }}
    '@type': cim:StreetAddress
    cim:StreetAddress.postalCode: {{ pc }}
    cim:StreetAddress.streetDetail:
      '@id': urn:uuid:{{ uuid5('sd_' + ean + pc + hn) }}
  # --- cim:StreetDetail ------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('sd_' + ean + pc + hn) }}
    '@type': cim:StreetDetail
    cim:StreetDetail.number: "{{ hn | replace(' ELP', '') }}"
  - '@id': urn:uuid:{{ uuid5('pp_' + ean + pc + hn) }}
    '@type': cim:PositionPoint
    cim:PositionPoint.xPosition: "{{ x_pos }}"
    cim:PositionPoint.yPosition: "{{ y_pos }}"
    cim:PositionPoint.Location:
      '@id': urn:uuid:{{ uuid5('l_' + ean + pc + hn) }}
