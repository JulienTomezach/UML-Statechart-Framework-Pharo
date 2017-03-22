as yet unclassified
execute: date
	| b |
	b := false.
	super execute: date.
	currentDate := date.
	sender currentDate: currentDate.
	"if our first date has been chosed"
	firstDate = date
		ifTrue: [ 
			firstDate := nil.
			childs
				do: [ :child | 
					child firstDate = date
						ifTrue: [ b := b or: (child execute: date) ] ] ].
	^ b