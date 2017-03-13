as yet unclassified
dispatch: data event: event parameter: parameter
	| rc currentState |
	rc := false.
	currentState := (data getRuntimeData: self) currentState.
	rc := currentState dispatch: data event: event parameter: parameter.

	" call dispatch as long as we hit states with end transitions
       J.T: the case when there is no event needed for the transition"
	[ currentState := (data getRuntimeData: self) currentState ]
		doWhileTrue: [ currentState isNotNil and: (currentState dispatch: data event: nil parameter: nil) ].
	^ rc