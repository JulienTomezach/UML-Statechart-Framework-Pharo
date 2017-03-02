as yet unclassified
createRuntimedata: s
	|data|
	data := activeStates at: s ifAbsent: [nil].
    data ifNil: [
      data := StateRuntimeData new.
      activeStates at:s  put:data.
    ].
    ^ data