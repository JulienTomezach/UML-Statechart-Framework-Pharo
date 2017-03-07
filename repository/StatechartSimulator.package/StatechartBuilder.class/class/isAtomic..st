building-states
isAtomic: node
	^((node elementsAt: 'parralel') isEmpty) and: ((node elementsAt: 'state') isEmpty)