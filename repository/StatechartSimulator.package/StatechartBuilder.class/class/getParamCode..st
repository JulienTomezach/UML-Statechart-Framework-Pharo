as yet unclassified
getParamCode: sendNode
	| paramList code |
	code := '.paramSent:= Parameter new.'.
	paramList := sendNode elementsAt: 'param'.
	paramList
		do: [ :paramNode | 
			| nameV expr |
			nameV := paramNode attributeAt: 'name'.
			expr := paramNode attributeAt: 'expr'.
			(nameV isNotEmpty and: expr isNotEmpty)
				ifTrue: [ code := code , String cr , 'paramSent at: ''' , nameV , ''' put:' , expr , '.' ] ].
	^ code