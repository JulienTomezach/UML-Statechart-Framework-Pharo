as yet unclassified
name: nameP parent: parentP entryAction: entryActionP exitAction: exitActionP
	super
		name: nameP
		parent: parentP
		entryAction: entryActionP
		exitAction: exitActionP.
		
	parentP class name = 'ConcurrentState' ifTrue:[
      parentP addRegion: self
    ]