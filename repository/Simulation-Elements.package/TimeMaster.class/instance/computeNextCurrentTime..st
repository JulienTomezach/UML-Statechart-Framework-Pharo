as yet unclassified
computeNextCurrentTime: date
	| return |
	isDiscrete
		ifTrue: [ return := date ]
		ifFalse: [ (date - currentTime) asSeconds > 0 ifTrue: [(Delay forSeconds: (date - currentTime) asSeconds) wait].
			return := date ].
	debugMode
		ifTrue: [ | log |
			log := ' nextDate-currentDate='.
			log := log , (date - currentTime) asSeconds printString , ' '.
			Transcript
				show: log;
				cr ].
	^ return