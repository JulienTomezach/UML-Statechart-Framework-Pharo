as yet unclassified
deactivate: state
	(activeStates
		includesKey: state)
		ifTrue: [ | data |
			data := self getRuntimeData: state.
			data active: false.
			data := nil.
			activeStates removeKey: state ]