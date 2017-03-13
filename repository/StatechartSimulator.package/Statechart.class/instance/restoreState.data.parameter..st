as yet unclassified
restoreState: state data: data parameter: parameter
	| path parent |
	(data isActive: self) ifTrue: [ ^ false ] data reset.

	"get the path from the state to the root"
	path := LinkedList new.
	parent := state.
	[ parent isNotNil ]
		doWhileTrue: [ path addFirst: parent.
			parent := parent context ].

	" active tous les states parents"
	path do: [ :s | s activate: data parameter: parameter ].
	^ true