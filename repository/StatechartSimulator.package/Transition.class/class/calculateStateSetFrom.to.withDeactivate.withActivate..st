as yet unclassified
calculateStateSetFrom: start to: end withDeactivate: deactivate withActivate: activate
	| a d s e min lca |
	" temp vectors for calculating the LCA (least common ancestor)"
	a := LinkedList new.
	d := LinkedList new.

	" get all states for possible deactivation"
	s := start.
	[ s isNotNil ]
		whileTrue: [ | context |
			d addFirst: s.
			context := s context.

			" If context is hierarchical or concurrent state, get it as parent."
			(context isNotNil and: (context class name = #Statechart) not)
				ifTrue: [ s := context ]
				ifFalse: [ s := nil ] ].



	" get all states for possible activation"
	e := end.
	[ e isNotNil ]
		whileTrue: [ | context |
			a addFirst: e.
			context := e context.
			" If context is hierarchical or concurrent state, get it as parent."
			(context isNotNil and: (context class name = #Statechart) not)
				ifTrue: [ e := context ]
				ifFalse: [ e := nil ] ].

	"
      Get LCA number. It is min by default. Therefore we make sure that if
      start equals end, we do not get the whole path up to the root node if the
      state is a substate.
     "
	min := {a size.
	d size} min.
	lca := min.

	" get the LCA-State"
	start = end
		ifFalse: [ | i |
			i := 1.
			[ (a at: i) = (d at: i) and: i < (min + 1) ] whileTrue: [ i := i + 1 ].
			lca := i ].
	lca to: d size do: [ :j | deactivate addFirst: (d at: j) ].
	lca to: a size do: [ :j | activate add: (a at: j) ]
	"if the first entry is not equal we got the LCA"
	" Fill the given vectors for the transition"