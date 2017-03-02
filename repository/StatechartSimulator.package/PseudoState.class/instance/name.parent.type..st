as yet unclassified
name: nameP parent: parent type: typeP
	self
		name: nameP
		parent: parent
		entryAction: nil
		exitAction: nil.
	type := typeP.
	type = self class pseudostate_start
		ifTrue: [ parent startState = nil
				ifTrue: [ parent startState: self ]
				ifFalse: [ StatechartException new signal: 'Parent has already a start state!' ] ]