|process port|

[ Gofer new squeaksource: 'OSProcess'; package: 'OSProcess'; load ] fork.

[ OSProcess isNil ] whileTrue: [(Delay forSeconds: 1) wait].	process := OSProcess thisOSProcess.
port := process 
	ifNil: [ ^ 8080 ] 
	ifNotNil: [ |pt| 
		[ process environmentAt: 'PORT'] 
			ifNil: [ ^ 8080 ] 
			ifNotNil: [ ^ process environmentAt: 'PORT' ]
] .
ZnServer startDefaultOn: port.


SmalltalkImage current snapshot: true andQuit: true

