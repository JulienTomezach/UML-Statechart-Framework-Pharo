accessing
address
	address
		ifNil: [ (id isNotNil and: parent isNotNil)
				ifTrue: [ address := id , parent address ]].
		^ address