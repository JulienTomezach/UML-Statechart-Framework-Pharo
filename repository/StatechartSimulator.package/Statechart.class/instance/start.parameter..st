as yet unclassified
start: data parameter: parameter
    data reset.
    data activate: self.
    data activate: startState.
    ^ self dispatch: data event: nil parameter: parameter.