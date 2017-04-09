# UML-Statechart-Framework-Pharo

This project is a fork of: https://github.com/klangfarbe/UML-Statechart-Framework-for-Java but in Pharo.

## Installation  
You have to import this project in Pharo as a file tree poject.
Then in the metaclass StatechartConstants, in the method initialize, put your path for the statechart folder that will contain scxml files.
It is an absolute path which is bad but I didn't achieve to make it otherwise with pharo and gitHub...  
Run the tests of the StatechartSimulator-Test package and if everything is green you are done.
Some tests have been commented because they test real time and so take several seconds to succeed.

## Differences with the original project

Except the language, there are other differences:  
_ We use block closures instead of deriving the classes Action and Guard. So, it avoids an explosion of classes.  
_ We don't use threads for managing events and timeout events. Because threads are evil.

Concurrent states are also executed one after the other in document order (e.q in order of insertion in the statechart) but it was already the case in the original project.

We also created an other package that is used to make the link with a discrete-event based simulation.
