as yet unclassified
isStarted
	| b |
	b := true.
	childs do: [ :child |  b := b and: child isStarted].
	^b