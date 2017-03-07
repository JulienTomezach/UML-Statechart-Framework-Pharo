as yet unclassified
at: aVarName
	^ variables
		at: aVarName
		ifAbsent: [ contextData ifNotNil: [ contextData at: aVarName ] ifNil: [ nil ] ]