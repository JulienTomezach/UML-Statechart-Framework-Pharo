as yet unclassified
equals: event
	event ifNotNil: [ ^ type = event type ]
	ifNil: [ ^ false ]