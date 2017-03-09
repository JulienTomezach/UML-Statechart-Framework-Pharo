as yet unclassified
at: data put: statechart
	statecharts at: data put: statechart.
	data objectID ifNotNil: [  
		 statechartLocalData at: data objectID put: data]