'::
	Toggle_BuffAndAttack:=!Toggle_BuffAndAttack
	If Toggle_BuffAndAttack
		SetTimer, BuffAndAttack, 1
	Else
		SetTimer, BuffAndAttack, Off
return

+::
	Toggle_AttackWithTarget:=!Toggle_AttackWithTarget
	If Toggle_AttackWithTarget
		SetTimer, AttackWithTarget, 1
	Else
		SetTimer, AttackWithTarget, Off
return

$f1::
	Send {f1}
	Send 0
Return

$f3::
	Send {f3}
	Send 9
	Sleep, 200
	Send 0
Return

BuffAndAttack:
	SendMode Event
	SetKeyDelay 50,50
	keys:=[7,3,4,5,6]
	For i,k in keys
	{
		if !Toggle_BuffAndAttack
			Return
		Send %k%
	}
Return

AttackWithTarget:
	SendMode Event
	SetKeyDelay 50,50
	keys:=[7,3,4,5,6]
	Send ^2
	Send ç
	For i,k in keys
	{
		if !Toggle_BuffAndAttack
			Return
		Send %k%
	}
Return
