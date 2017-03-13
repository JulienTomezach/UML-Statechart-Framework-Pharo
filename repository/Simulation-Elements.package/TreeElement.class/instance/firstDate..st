accessing
firstDate: anObject
	firstDate := anObject.
	parent ifNotNil: [ parent addFirst: firstDate  ]