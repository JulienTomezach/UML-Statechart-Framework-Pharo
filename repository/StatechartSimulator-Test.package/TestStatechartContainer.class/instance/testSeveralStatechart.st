as yet unclassified
testSeveralStatechart
	| center statechart root data1 data2 expected data3 param |
	center := StatechartContainer new.
	statechart := StatechartBuilder
		buildFromFile: StatechartConstants statechartFolderPath , 'testAction.xml'.
	data1 := Metadata new.
	statechart start: data1.
	center at: data1 put: statechart.
	statechart := StatechartBuilder
		buildFromFile: StatechartConstants statechartFolderPath , 'testConcurrent.xml'.
	data2 := Metadata new.
	statechart start: data2.
	center at: data2 put: statechart.
	statechart := StatechartBuilder
		buildFromFile:  StatechartConstants statechartFolderPath ,'testHierarchical.xml'.
	data3 := Metadata new.
	statechart start: data3.
	center at: data3 put: statechart.
	center dispatch: data2 event: (Event new type: 'b').
	param := Dictionary new.
	param at: 'bool' put: true.
	param at: 'text' put: '2'.
	center dispatch: data3 event: (Event new type: 'a') parameter: param.
	center dispatch: data3 event: (Event new type: 'b').
	center dispatch: data2 event: (Event new type: 'c').
	center dispatch: data3 event: (Event new type: 'c').
	center dispatch: data3 event: (Event new type: 'd').
	center dispatch: data3 event: (Event new type: 'e').
	statechart := center at: data1.
	root := statechart root.
	expected := 'A entry' , String cr , 'AB transit' , String cr , 'B exit' , String cr.
	self assert: ((data1 getData: root) stateData at: 'stream') contents equals: expected.
	statechart := center at: data2.
	root := statechart root.
	expected := '1' , '2' , 'leaving stateAa' , '3'.
	self assert: ((data2 getData: root) stateData at: 'stream') contents equals: expected.
	statechart := center at: data3.
	root := statechart root.
	expected := '1' , '2' , '3' , '4' , '5' , '6' , '7'.
	self assert: ((data3 getData: root) stateData at: 'stream') contents equals: expected