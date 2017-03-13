as yet unclassified
addFirst: date
	firstDate
		ifNotNil: [ self firstDate > date
				ifTrue: [ self firstDate: date.
					parent ifNotNil: [ self parent addFirst: self firstDate ] ] ]
		ifNil: [ self firstDate: date.
			parent ifNotNil: [ self parent addFirst: self firstDate ] ].