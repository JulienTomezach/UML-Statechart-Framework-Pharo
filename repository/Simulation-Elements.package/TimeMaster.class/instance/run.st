as yet unclassified
run
	| d |
	world isStarted
		ifTrue: [ d := world firstDate.
			d >= currentTime
				ifTrue: [ currentTime := self computeNextCurrentTime: d ].
			(world execute: currentTime)
				ifTrue: [ self run ] ]
		ifFalse: [ world start: currentTime.
			self run ]