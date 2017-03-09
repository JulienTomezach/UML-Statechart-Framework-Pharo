building-states
addEntryAction: node state: state
	| entryNode  |
	entryNode := node elementAt: 'onentry' ifAbsent: [ ^ false ].
	state entryAction: (self turnIntoAction: entryNode)