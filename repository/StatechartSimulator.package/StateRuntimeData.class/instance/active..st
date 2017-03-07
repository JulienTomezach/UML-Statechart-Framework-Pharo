as yet unclassified
active: aBoolean
	active := aBoolean.
	active ifTrue: [  stateData := StateData new] ifFalse: [ currentState := nil. stateData := nil ].