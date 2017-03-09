building-states
addInit: node parent: parent
	| attr elem nameState state|
	attr := node attributeAt: 'initial'.
	elem := node elementAt: 'initial'.
	nameState := 'start' , (node attributeAt: 'id').
	attr ifEmpty: [ elem ifNil: [ ^ false ] ].
	state := PseudoState new
		name: nameState 
		parent: parent
		type: PseudoState pseudostate_start.
	allStatesCreated at: nameState put: state