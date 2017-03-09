as yet unclassified
testConcurrent
	| data statechart expected root |
	statechart := StatechartBuilder
		buildFromFile:  StatechartConstants statechartFolderPath ,'testConcurrent.xml'.
	root := statechart root.
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'b').
	statechart dispatch: data event: (Event new type: 'c').
	expected := '1' , '2' , 'leaving stateAa' , '3'.
	self assert: ((data getData: root) stateData at: 'stream') contents equals: expected