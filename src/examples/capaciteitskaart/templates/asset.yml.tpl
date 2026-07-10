  # --- cim:Asset -------------------------------------------------------------
  - '@id': urn:uuid:{{ uuid5('as_' + pt) }}
    '@type': cim:Asset
    cim:Asset.PowerSystemResources:
      - urn:uuid:{{ uuid5(pt) }}
    cim:IdentifiedObject.mRID: {{ uuid5('as_' + pt) }}
    cim:IdentifiedObject.name: {{ pt }}
