as yet unclassified
testConcurrentInOrder
	| statechart start final stateConc stateA stateB startA startB finalA finalB stateAa stateBa data expected |
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
	stateAa := State new name: 'stateAa' parent: stateA.
	stateBa := State new name: 'stateBa' parent: stateB.
	finalA := FinalState new name: 'finalA' parent: stateA.
	finalB := FinalState new name: 'finalB' parent: stateB.

	"Transitions"

	"Transition new start: start end: stateConc action: (Action new body: [ :d | result := result , '1' ])."
	Transition new start: start end: stateConc.
	Transition new
		start: stateConc
		end: final
		action: (Action new body: [ :d | result := result , '3' ]).
	Transition new start: startA end: stateAa.
	Transition new start: startB end: stateBa.
	Transition new
		start: stateAa
		end: finalA
		event: (Event new type: 'a')
		action: (Action new body: [ :d | result := result , '1' ]).
	Transition new
		start: stateBa
		end: finalB
		event: (Event new type: 'a')
		action: (Action new body: [ :d | result := result , '2' ]).
	"dispatch event"
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'a').
	expected := '1' , '2' , '3'.
	self assert: result equals: expected