building-states
addCurrentNode: node parent: parent
	| state nameState |
	"is it a Parallel or a State"
	nameState := node attributeAt: 'id'.
	node name = 'parallel'
		ifTrue: [ state := ConcurrentState new name: nameState parent: parent ]
		ifFalse: [ node name = 'state' ifTrue:[ state := State new name: nameState parent: parent ]].
	allStatesCreated at: nameState put: state.
	^ state