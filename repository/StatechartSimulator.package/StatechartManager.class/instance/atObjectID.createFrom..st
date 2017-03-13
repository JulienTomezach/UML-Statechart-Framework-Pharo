as yet unclassified
atObjectID: idP createFrom: chartPath
	| chart data |
	chart := StatechartBuilder buildFromFile: chartPath.
	data := Metadata new chart: chart.
	data id: idP.
	data parent: self.
	^ data