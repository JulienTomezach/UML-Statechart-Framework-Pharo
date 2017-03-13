event handling
activate: state
	| data |
	data := self getRuntimeData: state.
	data isNil
		ifTrue: [ data := StateRuntimeData new.
			activeStates at: state put: data ].
	data active: true.
	state context
		ifNotNil: [ data stateData contextData: (self getRuntimeData: state context) stateData ].

	"update the context. if context is null we are at top level"
	state context isNotNil
		ifTrue: [ data := activeStates at: state context.
			data currentState: state ]