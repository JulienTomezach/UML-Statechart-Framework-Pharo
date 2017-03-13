as yet unclassified
turnIntoAction: actionContext
	| field sendNode bloc codeAdded |
	field := actionContext elementAt: 'script'.
	field ifNotNil: [ field := field strings first ] ifNil: [ field := '' ].	
	"we add the code for sending event"
	field := '|paramSent|' , field.
	sendNode := actionContext elementAt: 'send'.
	sendNode
		ifNotNil: [ | evtType id |
			evtType := sendNode attributeAt: 'event'.
			id := sendNode attributeAt: 'target'.
			(id isNotEmpty and: evtType isNotEmpty)
				ifTrue: [ | paramCode |
					paramCode := self getParamCode: sendNode.
					codeAdded := paramCode.
					codeAdded := codeAdded , '. sender send: (Event new:''' , evtType
						, ''') parameter: paramSent to: ''' , id , '''.'.
					field := field , codeAdded ] ].
	bloc := self turnIntoActionBloc: field.
	^ Action new: (Compiler evaluate: bloc)