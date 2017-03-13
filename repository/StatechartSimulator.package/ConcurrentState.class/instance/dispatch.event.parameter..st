as yet unclassified
dispatch: data event: event parameter: parameter
	" at least one region must dispatch the event"

	| dispatched statedata i |
	dispatched := false.
	statedata := data getRuntimeData: self.
	"
      Dispatch the event in all regions as long as this state is active. If we
      do not check this, an implicit exist would be ignored by this code.
     "
	regions
		do: [ :r | 
			(r dispatch: data event: event parameter: parameter)
				ifTrue: [ dispatched := true ] ].
	dispatched
		ifTrue: [ ^ true ].


	"
     Dispatch the event on this state. but make sure that all regions are
      finished before we can leave this state with the final-transition.
     "
	i := 1.
	[ statedata active and: i <= transitions size ]
		whileTrue: [ | t |
			t := transitions at: i.
			"If not finished, ignore all transitions without an event"
			(t hasEvent or: (self finished: data))
				ifTrue: [ (t execute: event data: data parameter: parameter)
						ifTrue: [ ^ true ] ].
			i := i + 1 ].
	^ false