as yet unclassified
start: d
	super start: d.
	currentDate := d. 
	sender currentDate: currentDate.
	childs do: [ :child | child start: d ]