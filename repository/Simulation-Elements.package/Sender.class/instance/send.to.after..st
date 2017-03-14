as yet unclassified
send: event to: objectID after: time
	event date ifNil: [ event date: currentDate ].
	event date: (event date + (Duration seconds: time)).
	(childs at: objectID) addEvent: event