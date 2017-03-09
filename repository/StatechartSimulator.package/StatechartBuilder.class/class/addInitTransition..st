building-transitions
addInitTransition: node
	| nameStart nameEnd |
	(self isAtomic: node)
		ifFalse: [ nameEnd := node attributeAt: 'initial'.
			nameStart := 'start' , (node attributeAt: 'id').
			nameEnd
				ifNotEmpty: [ Transition new
						start: (allStatesCreated at: nameStart)
						end: (allStatesCreated at: nameEnd) ] ]