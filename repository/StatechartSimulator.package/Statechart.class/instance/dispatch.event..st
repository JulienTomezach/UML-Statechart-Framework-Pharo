as yet unclassified
dispatch: data event: event
	| parameter |
	parameter := Parameter new.
	^ self dispatch: data event: event parameter: parameter