as yet unclassified
getDelayTime: sendNode
	| delayTime |
	delayTime := sendNode attributeAt: 'delay'.
	delayTime ifEmpty: [ ^ '0' ].
	^ delayTime