as yet unclassified
allowed: data parameter: parameter
	| target |
	guard
		ifNotNil: [ (guard check: data parameter: parameter)
				ifFalse: [ ^ false ] ].
	target := self activate last.
	target class name = 'PseudoState'
		ifTrue: [ ^ target lookup: data parameter: parameter ].
	^ true