as yet unclassified
activate: data parameter: parameter
	| d |
	data activate: self.
	d := data getRuntimeData: self.
	entryAction isNotNil
		ifTrue: [ entryAction execute: d stateData parameter: parameter sender: data sender].
	^ true