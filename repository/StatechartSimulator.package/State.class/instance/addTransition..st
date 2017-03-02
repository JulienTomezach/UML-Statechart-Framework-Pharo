as yet unclassified
addTransition: transition
	" make sure transition with guards are checked first"

	transition hasGuard
		ifTrue: [ transitions addFirst: transition]
		ifFalse: [ transitions add: transition ]