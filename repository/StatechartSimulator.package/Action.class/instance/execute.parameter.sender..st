as yet unclassified
execute: data parameter: param sender: sender
	body argumentCount = 1
		ifTrue: [ body value: data ].
	body argumentCount = 2
		ifTrue: [ body value: data value: param ].
	body argumentCount = 3
		ifTrue: [ body value: data value: param value: sender ]