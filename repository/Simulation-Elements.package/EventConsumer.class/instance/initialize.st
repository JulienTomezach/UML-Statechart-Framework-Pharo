as yet unclassified
initialize
	events := SortedCollection new
		sortBlock: [ :e1 :e2 | 
			| d1 d2 |
			d1 := e1 date.
			d2 := e2 date.
			d1 < d2 ].
	
	