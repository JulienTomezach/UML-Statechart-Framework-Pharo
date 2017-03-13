as yet unclassified
deactivate: data parameter: parameter
	| statedata |
	(data isActive: self)
		ifFalse: [ ^ false ].
	statedata := data getRuntimeData: self.
	statedata
		ifNil: [ super deactivate: data parameter: parameter.
			^ true ].



	"deactivate substate"
	statedata currentState
		ifNotNil: [ statedata currentState deactivate: data parameter: parameter ].
	super deactivate: data parameter: parameter