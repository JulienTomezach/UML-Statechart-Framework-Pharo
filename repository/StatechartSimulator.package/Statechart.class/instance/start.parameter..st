as yet unclassified
start: data parameter: parameter
	data reset.
	data activate: self.
	startState activate: data.
	^ self dispatch: data event: nil parameter: parameter