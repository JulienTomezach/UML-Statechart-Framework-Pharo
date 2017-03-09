as yet unclassified
testHierarchical
	| data statechart expected root param |
	statechart := StatechartBuilder
		buildFromFile:  StatechartConstants statechartFolderPath ,'testHierarchical.xml'.
	root := statechart root.
	data := Metadata new.
	statechart start: data.
	param := Dictionary new.
	param at: 'bool' put: true.
	param at: 'text' put: '2'.
	statechart dispatch: data event: (Event new type: 'a') parameter: param.
	statechart dispatch: data event: (Event new type: 'b').
	statechart dispatch: data event: (Event new type: 'c').
	statechart dispatch: data event: (Event new type: 'd').
	statechart dispatch: data event: (Event new type: 'e').
	expected := '1' , '2' , '3' , '4' , '5' , '6' , '7'.
	self assert: ((data getData: root) stateData at: 'stream') contents equals: expected