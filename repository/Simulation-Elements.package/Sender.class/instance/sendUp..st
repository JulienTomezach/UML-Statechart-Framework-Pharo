as yet unclassified
sendUp: event
	| address newAddress index |
	address := event to.
	index := address
		indexOf: manager id
		ifAbsent: [ senderParent sendUp: event.
			^ self ].
	newAddress := address copyFrom: (index+1) to: address size.
	event to: newAddress.
	newAddress size > 1
		ifTrue: [ | child |
			child := manager childAt: newAddress first.
			child sender sendDown: event ]
		ifFalse: [ self send: event ]