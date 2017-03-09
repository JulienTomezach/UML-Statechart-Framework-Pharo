## Under construction

# UML-Statechart-Framework-Pharo

This project is a fork of: https://github.com/klangfarbe/UML-Statechart-Framework-for-Java but in Pharo.

##Installation  
[TO DO: explain how to import file tree project]
In the metaclass StatechartConstants in the method initialize, put your path for the statechart folder.  
It is absolute which is bad but I didn't achieve to make it otherwise with pharo and gitHub...  
Run the tests of the StatechartSimulator-Test package and if everything is green you are done.

##Differences with the original project

Except the language, there are other differences:  
_ We use block closures instead of deriving the classes Action and Guard. So, it avoid an explosion of classes.  
_ We don't use threads for managing events and timeout events. Because threads are evil.

Concurrent states are also executed one after the other in document order (e.q in order of insertion in the statechart) but it was already the case in the original project.

##Documentation

You wil find under /statechartTested, the graphical representations of the several statecharts tested when you run the test suite.

For the rest of the documentation, it is the same as the original project which is very well explained.

##Design Problems with the OOP paradigm

_ We often use "if" condition on the class name of the object, for example to know if it is a pseudo state.  
Possible solution: send a message that will be interpreted differently whether it is a pseudo state or not.  
_ We often use "if" condition to know if an object is nil or not, for example to know if a transition has an event or not.  
(but that is inside the Transition object, so is it really a problem ?)  
Possible solution: use hasEvent, hasGuard and so on...

##Known uses

I use this Statechart simulator to compute the behaviours of agents inside a discrete-event based simulation.
