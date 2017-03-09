as yet unclassified
testGuards
	| statechart stateA stateB stateC stateD start final data result expected cond1 cond2 cond3 |
	result := ''.
	cond1 := true.
	cond3 := true.
	cond2 := false.
	statechart := Statechart new name: 'statechart'.
	start := PseudoState new
		name: 'start'
		parent: statechart root
		type: PseudoState pseudostate_start.
	final := FinalState new name: 'finale' parent: statechart.
	stateA := State new
		name: 'stateA'
		parent: statechart root
		entryAction: (Action new: [ :d :p | result := result , 'A entry' , String cr ])
		exitAction: nil.
	stateB := State new
		name: 'stateB'
		parent: statechart root
		entryAction: nil
		exitAction: (Action new: [ :d :p | result := result , 'B exit' , String cr ]).
	stateC := State new
		name: 'stateC'
		parent: statechart root
		entryAction: (Action new: [ :d :p | result := result , 'C entry' , String cr ])
		exitAction: (Action new: [ :d :p | result := result , 'C exit' , String cr ]).
	stateD := State new
		name: 'stateD'
		parent: statechart root
		entryAction: (Action new: [ :d :p | result := result , 'D entry' , String cr ])
		exitAction: (Action new: [ :d :p | result := result , 'D exit' , String cr ]).
	Transition new start: start end: stateA.
	Transition new
		start: stateA
		end: stateB
		event: nil
		guard: (Guard new: [ :d :p | cond1 ])
		action: (Action new: [ :d :p | result := result , 'AB transit' , String cr ]).
	Transition new
		start: stateB
		end: stateC
		event: (Event new type: 'EventBD')
		guard: (Guard new: [ :d :p | cond2 ])
		action: nil.
	Transition new
		start: stateB
		end: stateD
		event: (Event new type: 'EventBD')
		guard: (Guard new: [ :d :p | cond3 ])
		action: nil.
	Transition new start: stateD end: final.
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'EventAB').
	statechart dispatch: data event: (Event new type: 'EventBD').
	expected := 'A entry' , String cr , 'AB transit' , String cr , 'B exit' , String cr
		, 'D entry' , String cr , 'D exit' , String cr.
	self assert: result equals: expected