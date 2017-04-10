as yet unclassified
send: type parameter: parameter to: objectID after: time
	| event |
	event := Event new
		type: type;
		parameter: parameter;
		to: objectID.
	event date: manager currentDate + (Duration seconds: time).
	self sendUp: event