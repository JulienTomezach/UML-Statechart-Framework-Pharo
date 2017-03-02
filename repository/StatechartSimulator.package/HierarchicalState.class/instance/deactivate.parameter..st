as yet unclassified
deactivate: data parameter: parameter
	| statedata |
	(data isActive: self)
		ifFalse: [ ^ false ].
	statedata := data getData: self.
	statedata
		ifNil: [ super deactivate: data parameter: parameter.
			^ true ].



	"deactivate substate"
	statedata currentState
		ifNotNil: [ statedata currentState deactivate: data parameter: parameter ].
	statedata currentState: nil.
	super deactivate: data parameter: parameter