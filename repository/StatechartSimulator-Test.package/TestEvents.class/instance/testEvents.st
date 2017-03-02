as yet unclassified
testEvents
	| statechart stateA stateB stateC stateD start final data result expected |
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
	stateC := State new
		name: 'stateC'
		parent: statechart
		entryAction: (Action new: [ :d | result := result , 'C entry' , String cr ])
		exitAction: (Action new: [ :d | result := result , 'C exit' , String cr ]).
	stateD := State new
		name: 'stateD'
		parent: statechart
		entryAction: (Action new: [ :d | result := result , 'D entry' , String cr ])
		exitAction: (Action new: [ :d | result := result , 'D exit' , String cr ]).
	Transition new start: start end: stateA.
	Transition new
		start: stateA
		end: stateB
		event: (Event new type: 'EventAB')
		guard: nil
		action: (Action new: [ :d | result := result , 'AB transit' , String cr ]).
	Transition new
		start: stateB
		end: stateC
		event: (Event new type: 'EventBC')
		guard: nil
		action: nil.
	Transition new
		start: stateB
		end: stateD
		event: (Event new type: 'EventBD')
		guard: nil
		action: nil.
	Transition new start: stateD end: final.
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'EventAB').
	statechart dispatch: data event: (Event new type: 'EventBD').
	expected := 'A entry' , String cr , 'AB transit' , String cr , 'B exit' , String cr , 'D entry'
		, String cr , 'D exit' , String cr.	
	self assert: expected equals: result