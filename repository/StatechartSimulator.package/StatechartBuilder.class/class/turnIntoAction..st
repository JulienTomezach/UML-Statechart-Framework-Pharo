as yet unclassified
turnIntoAction: actionContext
	| field sendNode bloc |
	field := actionContext elementAt: 'script'.
	field ifNotNil: [ field := field strings first ] ifNil: [ field := '' ].
	sendNode := actionContext elementAt: 'send'.
	sendNode ifNotNil: [  ].
	bloc := self turnIntoBloc: field.
	^ Action new: (Compiler evaluate: bloc)