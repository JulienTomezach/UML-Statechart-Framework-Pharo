as yet unclassified
atObjectID: id createFrom: chartPath
|chart data|
chart := StatechartBuilder
		buildFromFile: chartPath.
	data := Metadata new.
	chart start: data.
	self at: data put: chart.