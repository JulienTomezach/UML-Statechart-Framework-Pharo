building-states
addExitAction: node state: state
	| exitNode |
	exitNode := node elementAt: 'onexit' ifAbsent: [ ^ false ].
	state exitAction: 	(self turnIntoAction: exitNode)