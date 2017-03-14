as yet unclassified
run
	| d |
	world isStarted
		ifTrue: [ d := world firstDate.
			d ifNotNil: 
			[d >= currentTime
				ifTrue: [ currentTime := self computeNextCurrentTime: d ].
			(world execute: currentTime)
				ifTrue: [ self run ] ] ifNil: [ "nothing to do anymore" ].] 
		ifFalse: [ world start: currentTime.
			self run ]