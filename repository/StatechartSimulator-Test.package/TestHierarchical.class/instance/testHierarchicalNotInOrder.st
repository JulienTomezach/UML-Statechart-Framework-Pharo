as yet unclassified
testHierarchicalNotInOrder
	| statechart start startH final finalH stateB stateAH stateBH data expected |
	"creation of the states"
	statechart := Statechart new name: 'statechart'.
	start := PseudoState new
		name: 'start'
		parent: statechart root
		type: PseudoState pseudostate_start.
	final := FinalState new name: 'final' parent: statechart root.
	stateB := HierarchicalState new name: 'stateB' parent: statechart root.
	startH := PseudoState new
		name: 'startH'
		parent: stateB
		type: PseudoState pseudostate_start.
	stateAH := State new name: 'stateAH' parent: stateB.
	stateBH := State new name: 'stateBH' parent: stateB.
	finalH := FinalState new name: 'finalH' parent: stateB.
	"creation of the transitions"
	self
		createTrForStateB: stateB
		start: start
		final: final
		stateAH: stateAH
		stateBH: stateBH
		startH: startH
		finalH: finalH.
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'c').
	statechart dispatch: data event: (Event new type: 'e').
	expected := '1' , '3' , '5'.
	self assert: result equals: expected