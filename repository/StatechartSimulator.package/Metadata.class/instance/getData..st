as yet unclassified
getData: state
    ^ activeStates at: state ifAbsent: [ ^ nil ] 