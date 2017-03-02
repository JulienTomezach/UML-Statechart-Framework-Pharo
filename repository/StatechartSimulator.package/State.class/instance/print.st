as yet unclassified
print
	| msg |
	msg := ''.
	name isNotNil
		ifTrue: [ msg := name ].
	^ msg