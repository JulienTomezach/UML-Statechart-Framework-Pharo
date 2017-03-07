building-states
addExitAction: node state: state
	| exitNode bloc |
	exitNode := node elementAt: 'onexit' ifAbsent: [ ^ false ].
	bloc := (exitNode elementAt: 'script') strings first.
	state exitAction: (Action new: (Compiler evaluate: bloc))