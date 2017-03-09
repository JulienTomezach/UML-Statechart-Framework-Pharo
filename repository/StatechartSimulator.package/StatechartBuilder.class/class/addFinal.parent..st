building-states
addFinal: node parent: parent
	| elem nameState state |
	elem := node elementAt: 'final'.
	elem ifNil: [ ^ false ].
	nameState := elem attributeAt: 'id'.
	state := FinalState new name: nameState parent: parent.
	allStatesCreated at: nameState put: state.