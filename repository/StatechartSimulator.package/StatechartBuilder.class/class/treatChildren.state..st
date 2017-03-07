building-states
treatChildren: node state: state
	(self isAtomic: node) ifFalse: [ 
		self treatNotAtomic: node state: state
		 ]