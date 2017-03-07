as yet unclassified
testConcurrent
	| data statechart expected root |
	statechart := StatechartBuilder
		buildFromFile: 'C:\Users\Falcon\Documents\AppliSys\testConcurrent.xml'.
	root := statechart root.
	data := Metadata new.
	statechart start: data.
	statechart dispatch: data event: (Event new type: 'a').
	statechart dispatch: data event: (Event new type: 'b').
	statechart dispatch: data event: (Event new type: 'c').
	statechart dispatch: data event: (Event new type: 'd').
	statechart dispatch: data event: (Event new type: 'e').
	expected := '1' , '2' , '3' , '4' , '5' , '6' , '7'.
	self assert: ((data getData: root) stateData at: 'stream') contents equals: expected