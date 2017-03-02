as yet unclassified
addIncomingTransition: t
   incoming isNil ifTrue: [  
      incoming := LinkedList new.
    ].
    incoming add: t