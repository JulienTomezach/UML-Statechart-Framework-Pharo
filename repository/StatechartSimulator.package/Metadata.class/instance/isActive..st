testing
isActive: state
	(self activeStates includesKey: state) ifTrue: [ ^ (self getRuntimeData: state) active ].
	^ false