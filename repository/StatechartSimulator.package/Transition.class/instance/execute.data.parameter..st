as yet unclassified
execute: eventP data: data parameter: parameter
	" check if the event can be handled"
	|i contextData|
	event
		ifNotNil: [ (event equals: eventP)
				ifFalse: [ ^ false ] ].
	event
		ifNotNil: [ eventP isNil
				ifTrue: [ ^ false ] ].
	(self allowed: data parameter: parameter)
		ifFalse: [ ^ false ].

	" deactivate all states"
	deactivate do: [ :state | state deactivate: data parameter: parameter ].

	" Execute exit-action"
	contextData := data getData: activate first context. 
	action isNotNil
		ifTrue: [ action execute: contextData stateData parameter: parameter ].

	" Activate all new states"
	i:= 1.
	activate do: [ :state | 
		 "
        check if we activate an concurrent state imlicit and if so make sure
        adding the correct region to the list of regions to ignore on
        activation. It is activated by this transition.
       "
       ((activate last = state) not and: state class name = 'ConcurrentState') ifTrue:[
 |cd|       
	cd := data createRuntimedata: state.

        (cd stateset includes: (activate at: i + 1)) ifFalse: [  
          cd stateset add: (activate at: i + 1)
        ]
      ].
		
		state activate: data parameter: parameter.
		i:= i+1 
		].
	^ true