as yet unclassified
execute: date
	super execute: date.
	events ifEmpty: [ ^ false ].
	firstDate = date
		ifTrue: [ | e |
			e := events first.
			[ e date = date ]
				whileTrue: [ events removeFirst.
					self executeAux: e.
					events ifEmpty: [ ^ true ].
					e := events first ] ].
	self firstDate: events first.
	^ true