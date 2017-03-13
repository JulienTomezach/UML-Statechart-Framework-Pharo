as yet unclassified
activate: data  parameter: parameter

    (data isActive: self)  ifFalse: [
      data activate: self.
      
      " trigger the timout events if available"
      
    entryAction isNotNil ifTrue: [ entryAction execute: ((data getRuntimeData: self) stateData) parameter: parameter sender: data sender].

      ^ true.
    ].
    ^ false.