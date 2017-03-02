as yet unclassified
dispatch: data event: event parameter: parameter
    
	|statedata rc|
	
	(data isActive: self) ifFalse: [
      ^ false
    ].

    statedata := data getData: self.

    " Use startstate on activation if available"
    (statedata currentState isNil and: startState isNotNil) ifTrue: [
      data activate: startState.
      statedata currentState activate:data parameter:parameter
    ].

    " delegate event to substate "
    rc := false.

    statedata currentState ifNotNil: [
      rc := statedata currentState dispatch: data event: event parameter: parameter
    ].

    "
      If the substate dispatched the event and we reached the finalstate or this
      state is no longar active, trigger a new dispatch for the end transition, 
      otherwise return.
     "
    ((rc and: (statedata currentState class name = 'FinalState') not) or: (data isActive: self) not) ifTrue: [
      ^ rc
    ].

    "
      If no substate can handle the event try to find a transition on this state
      which can. There are 3 possibilities:
      - The endstate is reached: Call the finishing transition
      - Handle the event with a transition from this state
      - Handle the event with a transition inherited from the context
    "
	transitions do:[:t|
		((statedata currentState class name = FinalState) or: t hasEvent) ifTrue: [
		"
        If the endstate is active and the transition is a finishing transition 
        (it has not event), trigger the transition without the event.
        
        Otherwise try to trigger the transition with the event.
       "
	   (statedata currentState class name = 'FinalState' and: t hasEvent not) ifTrue: [
			(t execute: nil data: data parameter: parameter) ifTrue: [ ^ true]
	   ].
	   
	   " try to fire the transision"
	   (t execute: event data: data parameter: parameter) ifTrue: [
		^ true
	   ].
	   
		]		
	
	].
	^ false