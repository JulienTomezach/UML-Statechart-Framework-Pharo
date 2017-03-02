as yet unclassified
activate: data parameter: parameter
    |d|
	data activate: self.
    d := data getData: self.

    entryAction isNotNil ifTrue:[
      entryAction execute: data parameter: parameter
	].
	
	^ true.