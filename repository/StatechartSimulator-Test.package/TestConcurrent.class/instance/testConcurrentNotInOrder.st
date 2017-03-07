as yet unclassified
testConcurrentNotInOrder
	| statechart start final stateConc stateA stateB startA startB stateAa stateAb stateBa stateBb data expected |
	"creation of the states"
	statechart := Statechart new name: 'statechart'.
	start := PseudoState new
		name: 'start'
		parent: statechart root
		type: PseudoState pseudostate_start.
	final := FinalState new name: 'final' parent: statechart root.
	stateConc := ConcurrentState new name: 'stateConc' parent: statechart root.
	stateA := HierarchicalState new name: 'stateA' parent: stateConc.
	stateB := HierarchicalState new name: 'stateB' parent: stateConc.
	startA := PseudoState new
		name: 'startA'
		parent: stateA
		type: PseudoState pseudostate_start.
	startB := PseudoState new
		name: 'startB'
		parent: stateB
		type: PseudoState pseudostate_start.
	stateAa := State new
		name: 'stateAa'
		parent: stateA
		exitAction: (Action new: [ :d | result := result , 'leaving stateAa' ]).
	stateBa := State new name: 'stateBa' parent: stateB.
	stateAb := State new name: 'stateAb' parent: stateA.
	stateBb := State new
		name: 'stateBb'
		parent: stateB
		exitAction: (Action new body: [ :d | result := result , '2' ]).
	"-----------"
	"Transitions"
	"-----------"
	Transition new start: start end: stateAa.
	Transition new
		start: stateBb
		end: final
		event: (Event new type: 'c')
		action: (Action new body: [ :d | result := result , '3' ]).
	Transition new start: startA end: stateAa.
	Transition new start: startB end: stateBa.
	Transition new start: stateAa end: stateAb event: (Event new type: 'a').
	Transition new
		start: stateBa
		end: stateBb
		event: (Event new type: 'b')
		action: (Action new body: [ :d | result := result , '1' ]).
	"dispatch event"
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'b').
	statechart dispatch: data event: (Event new type: 'c').
	expected := '1' , '2' , 'leaving stateAa' , '3'.
	self assert: result equals: expected