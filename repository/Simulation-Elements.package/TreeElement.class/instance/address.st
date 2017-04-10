accessing
address
	address
		ifNil: [ (id isNotNil and: parent isNotNil)
				ifTrue: [ address := parent address copy.
					address add: id ] ].
	^ address