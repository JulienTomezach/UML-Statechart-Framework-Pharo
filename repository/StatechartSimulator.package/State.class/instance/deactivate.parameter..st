as yet unclassified
deactivate: data parameter: parameter
	(data
		isActive: self)
		ifTrue: [ |contextData|
			contextData := data getRuntimeData: self context.
			data deactivate: self.
			exitAction isNotNil
				ifTrue: [ exitAction execute: (contextData  stateData) parameter: parameter sender: data sender] ]
	