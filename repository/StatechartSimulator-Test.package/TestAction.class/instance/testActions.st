as yet unclassified
testActions
	| statechart stateA stateB start final data result expected |
	result := ''.
	statechart := Statechart new name: 'statechart'.
	start := PseudoState new name: 'start' parent: statechart type: PseudoState pseudostate_start.
	final := FinalState new name: 'finale' parent: statechart.
	stateA := State new
		name: 'stateA'
		parent: statechart
		entryAction: (Action new: [ :d | result := result , 'A entry' , String cr ])
		exitAction: nil.
	stateB := State new
		name: 'stateB'
		parent: statechart
		entryAction: nil
		exitAction: (Action new: [ :d | result := result , 'B exit' , String cr ]).
	Transition new start: start end: stateA.
	Transition new
		start: stateA
		end: stateB
		event: nil
		guard: nil
		action: (Action new: [ :d | result := result , 'AB transit' , String cr ]).
	Transition new start: stateB end: final.
	data := Metadata new.
	statechart start: data.
	expected := 'A entry' , String cr , 'AB transit' , String cr , 'B exit' , String cr.
	self assert: expected equals: result