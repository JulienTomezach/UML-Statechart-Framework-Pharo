building-states
addEntryAction: node state: state
	| entryNode bloc |
	entryNode := node elementAt: 'onentry' ifAbsent: [ ^ false ].
	bloc := (entryNode elementAt: 'script') strings first.
	state entryAction: (Action new: (Compiler evaluate: bloc))