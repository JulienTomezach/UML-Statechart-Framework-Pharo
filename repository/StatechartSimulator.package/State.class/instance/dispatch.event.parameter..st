as yet unclassified
dispatch: data event: event parameter: parameter 
	1 to: transitions size do: [:i |
	((transitions at: i) execute: event data: data parameter: parameter) ifTrue: [^ true]
	].
	^ false