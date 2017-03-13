as yet unclassified
finished: data 
    regions do: [:r| 
	
     ((data getRuntimeData: r) currentState class name = 'FinalState') ifFalse: [  
        ^ false
      ]
    ].
    ^true