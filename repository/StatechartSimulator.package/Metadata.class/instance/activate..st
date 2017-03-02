as yet unclassified
activate: state
	| data |
	data := self getData: state.
	data isNil
		ifTrue:
			[ data := StateRuntimeData new.
			activeStates at: state put: data ]. data
		active: true.
	data currentTime: Time current.
	data currentState: nil.

	"update the context. if context is null we are at top level"
	state context isNotNil
		ifTrue: [ data := activeStates at: state context.
			data currentState: state ]