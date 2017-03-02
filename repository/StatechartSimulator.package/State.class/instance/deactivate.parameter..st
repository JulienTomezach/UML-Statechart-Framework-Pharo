as yet unclassified
deactivate: data parameter: parameter
	(data
		isActive: self)
		ifTrue: [ data deactivate: self.
			exitAction isNotNil
				ifTrue: [ exitAction execute: data parameter: parameter ] ]
	