building-states
treatNotAtomic: node state: state
	self addInit: node parent: state.
	self addFinal: node parent: state.
	(node elementsSelect: [ :n | n name = 'parallel' or: n name = 'state' ])
		do: [ :n | self treatRealState: n parent: state ]