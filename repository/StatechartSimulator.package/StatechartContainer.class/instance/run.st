as yet unclassified
run
	statecharts
		keysAndValuesDo:  [ :data :statechart | 
			| events |
			events := data events.
			events
				ifNotEmpty: [ | evPar evt param |
					[ evPar := events removeFirst.
					evPar size = 2
						ifTrue: [ evt := evPar at: 0.
							param := evPar at: 1 ] ]
						doWhileTrue: [ "we continue while the event has not been accepted and there is still event to proceed"(statechart dispatch: data event: evt param: param) not and: events isNotEmpty ] ] ]