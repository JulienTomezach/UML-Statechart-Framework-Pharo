as yet unclassified
getRuntimeData: state
    ^ activeStates at: state ifAbsent: [ ^ nil ] 