as yet unclassified
lookup: data parameter: parameter
	transitions do:
		[ :t | (t allowed: data parameter: parameter) ifTrue: [ ^ true ] ].
	^ false