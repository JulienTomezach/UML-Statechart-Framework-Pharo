as yet unclassified
testPingPongInRealTime
	| tm center objIDState pathFolder |
	center := StatechartManager new.
	objIDState := Dictionary new.
	pathFolder := StatechartConstants statechartFolderPath.
	objIDState at: 'pingObject' put: pathFolder , 'ping.xml'.
	objIDState at: 'pongObject' put: pathFolder , 'pong.xml'.
	objIDState
		keysAndValuesDo: [ :id :chartPath | center atObjectID: id createFrom: chartPath ].
	tm := TimeMaster new debugMode: true.
	tm world: center.
	tm isDiscrete: false.
	tm run.
	"Transcript issue..."
	Halt now.
	self
		assert:
			((Transcript contents
				findTokens:
					{Character space.
					Character cr}) includes: 'nextDate-currentDate=20')