'::
	Toggle_BuffAndAttack:=!Toggle_BuffAndAttack
	If Toggle_BuffAndAttack
		SetTimer, BuffAndAttack, 1000
	Else
		SetTimer, BuffAndAttack, Off
return

«::
	Toggle_BuffOnly:=!Toggle_BuffOnly
	If Toggle_BuffOnly
		SetTimer, BuffOnly, 10000
	Else 
		SetTimer, BuffOnly, Off
return

BuffAndAttack:
	Send ^2
	Send 1
	Send {f3}
	Sleep, 100
	Send 2
	Sleep, 100
	Send 3
	Sleep, 100
	Send 4
	Sleep, 100
	Send 5
	Sleep, 100
	Send 6
	Sleep, 100
	Send 7
	Send ç
	Send {f1}
	Send 3
	Sleep, 100
	Send 4
	Sleep, 100
	Send 5
	Sleep, 100
	Send ^2
	Send {f3}
	Send 7
Return

BuffOnly:
	Send ^2
	Send 7
	Send 1
	Send {f3}
	Sleep, 100
	Send 2
	Sleep, 100
	Send 3
	Sleep, 100
	Send 4
	Sleep, 100
	Send 5
	Sleep, 100
	Send 6
	Sleep, 100
	Send 8
	Sleep, 100
	Send 7
Return
