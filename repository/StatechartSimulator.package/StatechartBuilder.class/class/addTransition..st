building-transitions
addTransition: trNode
	| start target event action guard field parent |
	event := nil.
	action := nil.
	guard := nil.
	target := allStatesCreated at: (trNode attributeAt: 'target').
	parent := trNode parent.
	parent name = 'state'
		ifTrue: [ start := allStatesCreated at: (parent attributeAt: 'id') ]
		ifFalse: [ parent name = 'initial'
				ifTrue: [ start := allStatesCreated at: 'start' , (parent parent attributeAt: 'id') ]
				ifFalse: [ ^ false ] ].
	field := trNode attributeAt: 'event'.
	field ifNotEmpty: [ Event new type: field ].
	field := trNode attributeAt: 'cond'.
	field ifNotEmpty: [ guard := Guard new: (Compiler evaluate: field) ].
	field := trNode elementAt: 'script'.
	field ifNotNil: [ action := Action new: (Compiler evaluate: field strings first) ].
	Transition new
		start: start
		end: target
		event: event
		guard: guard
		action: action