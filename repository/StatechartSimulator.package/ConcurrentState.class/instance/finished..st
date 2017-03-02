as yet unclassified
finished: data 
    regions do: [:r| 
	
     ((data getData: r) currentState class name = 'FinalState') ifFalse: [  
        ^ false
      ]
    ].
    ^true