as yet unclassified
start: data 
	data reset.
	data activate: self.
	startState activate: data.
	^ self dispatch: data event: nil