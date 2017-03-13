as yet unclassified
addEvent: event
	events add: event.
	event == events first
		ifTrue: [ self firstDate: event date ]