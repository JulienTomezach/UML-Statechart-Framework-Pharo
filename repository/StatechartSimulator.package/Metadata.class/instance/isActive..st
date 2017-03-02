as yet unclassified
isActive: state
	(self activeStates includesKey: state) ifTrue: [ ^ (self getData: state) active ].
	^ false