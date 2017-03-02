as yet unclassified
testHierarchicalInOrder
	| statechart start startH final finalH stateA stateB stateC stateAH stateBH data expected |
	"creation of the states"
	statechart := Statechart new name: 'statechart'.
	start := PseudoState new name: 'start' parent: statechart type: PseudoState pseudostate_start.
	final := FinalState new name: 'final' parent: statechart.
	stateA := State new name: 'stateA' parent: statechart.
	stateB := HierarchicalState new name: 'stateB' parent: statechart.
	stateC := State new name: 'stateC' parent: statechart.
	startH := PseudoState new name: 'startH' parent: stateB type: PseudoState pseudostate_start.
	stateAH := State new name: 'stateAH' parent: stateB.
	stateBH := State new name: 'stateBH' parent: stateB.
	finalH := FinalState new name: 'finalH' parent: stateB.
	"creation of the transitions"
	self
		createTrForStateA: stateA
		stateB: stateB
		stateC: stateC
		start: start
		final: final
		stateAH: stateAH
		stateBH: stateBH
		startH: startH
		finalH: finalH.
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'a').
	statechart dispatch: data event: (Event new type: 'b').
	statechart dispatch: data event: (Event new type: 'c').
	statechart dispatch: data event: (Event new type: 'd').
	statechart dispatch: data event: (Event new type: 'e').
	expected := '1' , '2' , '3' , '4' , '5' , '6' , '7'.
	self assert: result equals: expected