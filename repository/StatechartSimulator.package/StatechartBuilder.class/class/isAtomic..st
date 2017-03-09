building-states
isAtomic: node
	^ (node elementsAt: 'parallel') isEmpty and: (node elementsAt: 'state') isEmpty