as yet unclassified
sendDown: event
	| address newAddress |
	address := event to.
	newAddress := address copyFrom: 2 to: address size.
	newAddress size > 1
		ifTrue: [ | child |
			child := manager childAt: newAddress first.
			child sender sendDown: event ]
		ifFalse: [ self send: event ]