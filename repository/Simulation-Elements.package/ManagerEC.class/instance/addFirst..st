as yet unclassified
addFirst: date
	firstDate
		ifNotNil: [ self firstDate > date
				ifTrue: [ self firstDate: date.
					 ] ]
		ifNil: [ self firstDate: date ]