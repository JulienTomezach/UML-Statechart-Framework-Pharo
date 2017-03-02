as yet unclassified
start: start end: end
	self class
		calculateStateSetFrom: start
		to: end
		withDeactivate: deactivate
		withActivate: activate.
	start addTransition: self