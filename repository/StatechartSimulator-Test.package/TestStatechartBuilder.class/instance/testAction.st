as yet unclassified
testAction
	| data statechart expected root |
	statechart := StatechartBuilder
		buildFromFile: StatechartConstants statechartFolderPath , 'testAction.xml'.
	root := statechart root.
	data := Metadata new.
	statechart start: data.
	expected := 'A entry' , String cr , 'AB transit' , String cr , 'B exit' , String cr.
	self assert: ((data getRuntimeData: root) stateData at: 'stream') contents equals: expected