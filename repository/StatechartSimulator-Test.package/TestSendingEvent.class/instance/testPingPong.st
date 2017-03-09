as yet unclassified
testPingPong
	| center objIDState pathFolder |
	center := StatechartContainer new.
	objIDState := Dictionary new.
	pathFolder := StatechartConstants statechartFolderPath .
	objIDState at: 'pingObject' put: pathFolder , 'ping.xml'.
	objIDState at: 'pongObject' put: pathFolder , 'pong.xml'.
	objIDState keysAndValuesDo: [ :id :chartPath | center atObjectID: id createFrom: chartPath ].
	center run.
	self assert: true