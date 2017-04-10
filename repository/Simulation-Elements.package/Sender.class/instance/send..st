as yet unclassified
send: event
	|child|
	child := (manager childAt: (event to last)) .
	child ifNotNil: [child addEvent: event]