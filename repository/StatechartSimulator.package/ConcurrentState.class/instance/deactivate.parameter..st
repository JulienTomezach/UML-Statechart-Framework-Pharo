as yet unclassified
deactivate: data parameter: parameter
	(data getData: self) stateset removeAll.
	regions
		do: [ :r | 
			r deactivate: data parameter: parameter ].
	super deactivate: data parameter: parameter