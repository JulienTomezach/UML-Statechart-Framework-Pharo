as yet unclassified
allowed: data parameter: parameter
	| target source|
	source := deactivate first.
	guard
		ifNotNil: [ (guard check: (data getRuntimeData: source) stateData parameter: parameter)
				ifFalse: [ ^ false ] ].
	target :=  activate last.
	target class name = 'PseudoState'
		ifTrue: [ ^ target lookup: data parameter: parameter ].
	^ true