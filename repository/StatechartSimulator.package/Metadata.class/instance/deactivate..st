as yet unclassified
deactivate: state
	(activeStates
		includesKey: state)
		ifTrue: [ | data |
			data := self getData: state.
			data currentState: nil.
			data := nil.
			activeStates removeKey: state ]