as yet unclassified
createTrForStateA: stateA stateB: stateB stateC: stateC start: start final: final stateAH: stateAH stateBH: stateBH startH: startH finalH: finalH
	"just to shorten the test"

	Transition new
		start: start
		end: stateA
		action:
			(Action new
				body: [ :d | 
					result := result , '1' ]).
	Transition new
		start: stateA
		end: stateB
		event: (Event new type: 'a')
		action: (Action new body: [ :d | result := result , '2' ]).
	Transition new
		start: stateB
		end: stateC
		event: (Event new type: 'd')
		action: (Action new body: [ :d | result := result , '6' ]).
	Transition new start: startH end: stateAH action: (Action new body: [ :d | result := result , '3' ]).
	Transition new
		start: stateAH
		end: stateBH
		event: (Event new type: 'b')
		action: (Action new body: [ :d | result := result , '4' ]).
	Transition new
		start: stateBH
		end: finalH
		event: (Event new type: 'c')
		action: (Action new body: [ :d | result := result , '5' ]).
	Transition new
		start: stateC
		end: final
		event: (Event new type: 'e')
		action: (Action new body: [ :d | result := result , '7' ])