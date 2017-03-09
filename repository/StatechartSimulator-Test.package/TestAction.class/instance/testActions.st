as yet unclassified
testActions
	| statechart root stateA stateB start final data expected |
	statechart := Statechart new name: 'statechart'.
	root := statechart root.
	root
		entryAction: (Action new: [ :d :p | d at: 'stream' put: (WriteStream on: String new) ]).
	start := PseudoState new name: 'start' parent: root type: PseudoState pseudostate_start.
	final := FinalState new name: 'finale' parent: root.
	stateA := State new
		name: 'stateA'
		parent: root
		entryAction:
			(Action
				new: [ :d :p | 
					(d at: 'stream')
						nextPutAll: 'A entry';
						cr ])
		exitAction: nil.
	stateB := State new
		name: 'stateB'
		parent: root
		entryAction: nil
		exitAction:
			(Action
				new: [ :d :p| 
					(d at: 'stream')
						nextPutAll: 'B exit';
						cr ]).
	Transition new start: start end: stateA.
	Transition new
		start: stateA
		end: stateB
		event: nil
		guard: nil
		action:
			(Action
				new: [ :d :p | 
					(d at: 'stream')
						nextPutAll: 'AB transit';
						cr ]).
	Transition new start: stateB end: final.
	data := Metadata new.
	statechart start: data.
	expected := 'A entry' , String cr , 'AB transit' , String cr , 'B exit' , String cr.
	self assert: ((data getData: root) stateData at: 'stream') contents equals: expected