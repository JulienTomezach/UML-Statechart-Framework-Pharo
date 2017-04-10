as yet unclassified
testPingPongParam
	| center objIDState pathFolder tm |
	center := StatechartManager new.
		center id: 'world'.
	objIDState := Dictionary new.
	pathFolder := StatechartConstants statechartFolderPath.
	objIDState at: 'pingObject' put: pathFolder , 'pingParam.xml'.
	objIDState at: 'pongObject' put: pathFolder , 'pongParam.xml'.
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
					Character cr}) includes: 'receive_ping_with_a_gift')