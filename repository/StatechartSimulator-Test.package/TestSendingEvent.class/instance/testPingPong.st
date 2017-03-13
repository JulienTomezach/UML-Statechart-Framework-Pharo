as yet unclassified
testPingPong
	|tm center objIDState pathFolder |
	Transcript clear.
	center := StatechartManager new.
	objIDState := Dictionary new.
	pathFolder := StatechartConstants statechartFolderPath.
	objIDState at: 'pingObject' put: pathFolder , 'ping.xml'.
	objIDState at: 'pongObject' put: pathFolder , 'pong.xml'.
	objIDState
		keysAndValuesDo: [ :id :chartPath | center atObjectID: id createFrom: chartPath ].
	tm := TimeMaster new.
	tm world: center.
	tm run.	
	self
		assert:
			((Transcript contents
				findTokens:
					{Character space.
					Character cr}) occurrencesOf: 'send_pong')
		equals: 5