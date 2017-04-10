as yet unclassified
testPingPongWithHierarchicStructure
	| tm center sm1 sm2 objIDState pathFolder |
	center := ECManager new.
	center id: 'world'.
	sm1 := StatechartManager new.
	sm1 id: 'pingP'.
	sm2 := StatechartManager new.
	sm2 id: 'pongP'.
	sm1 parent: center.
	sm2 parent: center.
	objIDState := Dictionary new.
	pathFolder := StatechartConstants statechartFolderPath.
	objIDState at: 'pingObject' put: pathFolder , 'pingHierarchic.xml'.
	objIDState
		keysAndValuesDo: [ :id :chartPath | sm1 atObjectID: id createFrom: chartPath ].
	objIDState removeAll.
	objIDState at: 'pongObject' put: pathFolder , 'pongHierarchic.xml'.
	objIDState
		keysAndValuesDo: [ :id :chartPath | sm2 atObjectID: id createFrom: chartPath ].
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