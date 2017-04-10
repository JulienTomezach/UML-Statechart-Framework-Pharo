as yet unclassified
testPingPong
	| tm center objIDState pathFolder |
	center := StatechartManager new.
	center id: 'world'.
	objIDState := Dictionary new.
	pathFolder := StatechartConstants statechartFolderPath.
	objIDState at: 'pingObject' put: pathFolder , 'ping.xml'.
	objIDState at: 'pongObject' put: pathFolder , 'pong.xml'.
	objIDState
		keysAndValuesDo: [ :id :chartPath | center atObjectID: id createFrom: chartPath ].
	tm := TimeMaster new.
	tm world: center.
	tm run.
	"Transcript issue..."
	Halt now.
	self
		assert:
			((Transcript contents
				findTokens:
					{Character space.
					Character cr}) occurrencesOf: 'send_pong')
		equals: 5