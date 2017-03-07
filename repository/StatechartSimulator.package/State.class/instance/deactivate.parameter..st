as yet unclassified
deactivate: data parameter: parameter
	(data
		isActive: self)
		ifTrue: [ |contextData|
			contextData := data getData: self context.
			data deactivate: self.
			exitAction isNotNil
				ifTrue: [ exitAction execute: (contextData  stateData) parameter: parameter ] ]
	