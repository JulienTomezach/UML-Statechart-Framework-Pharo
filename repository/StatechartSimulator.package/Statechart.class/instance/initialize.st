as yet unclassified
initialize
	states := Dictionary new.
	root := HierarchicalState new name: 'root' parent: self.
	self startState: root