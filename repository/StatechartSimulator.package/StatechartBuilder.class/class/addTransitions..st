building-transitions
addTransitions: rootNode
	rootNode allElementsNamed: 'transition' do: [ :trNode | self addTransition: trNode ].
	(rootNode allNodesSelect: [ :n | n name = 'parallel' or: n name = 'state' ])
		do: [ :n | self addInitTransition: n ]