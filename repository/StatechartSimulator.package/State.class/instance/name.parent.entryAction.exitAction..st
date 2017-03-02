as yet unclassified
name: nameP parent: parentP entryAction: entryActionP exitAction: exitActionP
	"comment stating purpose of message"

	| parent |
	parent := parentP.
		context := parentP.
	name := nameP.
	entryAction := entryActionP.
	exitAction := exitActionP.
	transitions := LinkedList new.
	parent isNotNil
		ifTrue: [ [ parent context isNotNil ] whileTrue: [ parent := parent context ].
			parent class name = #Statechart
				ifTrue: [ statechart := parent.
					(statechart states includesKey: name)
						ifTrue: [ StatechartException signal: 'State name already used! Please define a unique name.' ].
					statechart states at: name put: self ]
				ifFalse: [ StatechartException signal: 'Cannot determine path to the statechart. Check the hierarchy.' ] ].