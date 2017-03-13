as yet unclassified
dispatch: data event: event 
event ifNil:[ self dispatch: data event: nil parameter: nil] ifNotNil: [  
	self dispatch: data event: event parameter: event parameter. ]