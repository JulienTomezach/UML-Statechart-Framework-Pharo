as yet unclassified
testSeveralStatechart
	| center statechart root data1 data2 expected data3 param date|
	center := StatechartManager new.
	data1 := center
		atObjectID: 'testAction'
		createFrom: StatechartConstants statechartFolderPath , 'testAction.xml'.
	data2 := center
		atObjectID: 'testConcurrent'
		createFrom: StatechartConstants statechartFolderPath , 'testConcurrent.xml'.
	data3 := center
		atObjectID: 'testHierarchical'
		createFrom: StatechartConstants statechartFolderPath , 'testHierarchical.xml'.
	date := DateAndTime current.
	data1 start: date.
	data2 start: date.
	data3 start: date.
	data2 executeAux: (Event new type: 'b').
	param := Dictionary new.
	param at: 'bool' put: true.
	param at: 'text' put: '2'.
	data3
		executeAux:
			(Event new
				type: 'a';
				parameter: param).
	data3 executeAux: (Event new type: 'b').
	data2 executeAux: (Event new type: 'c').
	data3 executeAux: (Event new type: 'c').
	data3 executeAux: (Event new type: 'd').
	data3 executeAux: (Event new type: 'e').
	statechart := data1 chart.
	root := statechart root.
	expected := 'A entry' , String cr , 'AB transit' , String cr , 'B exit' , String cr.
	self
		assert: ((data1 getRuntimeData: root) stateData at: 'stream') contents
		equals: expected.
	statechart := data2 chart.
	root := statechart root.
	expected := '1' , '2' , 'leaving stateAa' , '3'.
	self
		assert: ((data2 getRuntimeData: root) stateData at: 'stream') contents
		equals: expected.
	statechart :=  data3 chart.
	root := statechart root.
	expected := '1' , '2' , '3' , '4' , '5' , '6' , '7'.
	self
		assert: ((data3 getRuntimeData: root) stateData at: 'stream') contents
		equals: expected