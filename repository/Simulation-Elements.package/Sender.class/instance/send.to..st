as yet unclassified
send: event to: objectID
	event date ifNil: [ event date: currentDate ].
	(childs at: objectID) addEvent: event