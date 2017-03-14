as yet unclassified
computeNextCurrentTime: date
	debugMode
		ifTrue: [ | log |
			log := ' nextDate-currentDate='.
			log := log , (date - currentTime) asSeconds printString , ' '.
			Transcript
				show: log;
				cr ].
	isDiscrete
		ifTrue: [ ^ date ]