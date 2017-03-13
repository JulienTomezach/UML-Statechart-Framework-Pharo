as yet unclassified
deactivate: data parameter: parameter
	(data getRuntimeData: self) stateset removeAll.
	regions
		do: [ :r | 
			r deactivate: data parameter: parameter ].
	super deactivate: data parameter: parameter