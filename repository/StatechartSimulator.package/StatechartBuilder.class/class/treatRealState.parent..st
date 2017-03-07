building-states
treatRealState: node parent: parent
	|state|
	state := self addCurrentNode: node parent: parent.
	self addEntryAction: node state: state.
	self addExitAction: node state: state.
	self treatChildren: node state: state.