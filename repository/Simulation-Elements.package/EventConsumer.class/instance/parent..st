as yet unclassified
parent: p
	| e |
	super parent: p.
	e := (Event new: 'start').
	sender := parent sender.