as yet unclassified
buildFromFile: aFilePath
	| xmlDoc statechart root rootNode |
	allStatesCreated := Dictionary new.
	xmlDoc := XMLDOMParser parseFileNamed: aFilePath.
	statechart := Statechart new name: 'statechart'.
	root := statechart root.
	rootNode := xmlDoc root elementAt: 'state'.
	(rootNode attributeAt: 'id') = 'root'
		ifTrue: [ self addEntryAction: rootNode state: root.
			self addExitAction: rootNode state: root.
			self treatChildren: rootNode state: root.
			self addTransitions: rootNode.
			^ statechart ]
		ifFalse: [ ^ nil ]