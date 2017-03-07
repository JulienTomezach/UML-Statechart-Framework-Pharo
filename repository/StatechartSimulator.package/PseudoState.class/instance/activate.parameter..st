as yet unclassified
activate: data parameter: parameter
	| d |
	data activate: self.
	d := data getData: self.
	entryAction isNotNil
		ifTrue: [ entryAction execute: d stateData parameter: parameter ].
	^ true