as yet unclassified
activate: data parameter: parameter
	(super activate: data parameter: parameter)
		ifTrue: [ | statedata |
			statedata := data getData: self.
			regions
				do: [ :r | 
					" check if the region is activated implicit via a incoming transition"
					(statedata stateset includes: r)
						ifFalse: [
							(r activate: data parameter: parameter)
								ifTrue: [ r dispatch: data event: nil parameter: parameter ] ] ].
			^ true ].
	^ false