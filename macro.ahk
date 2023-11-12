#SingleInstance
SendMode "Event"
SetKeyDelay 50,50

global current_mode

Class Skill{
	cooldown:= 5
	key:=2
	belt:="f3"
	checkbox:=0
	trigger:=0
	last_cast:=0
	name:=""

	__New(checkbox,belt,key,cooldown){
		This.checkbox := checkbox
		This.belt:=belt
		This.key:=key
		This.cooldown:=cooldown

	}

	cast()
	{

		if current_mode == This.belt && This.checkbox.value == 1 && A_Now - This.last_Cast>= This.cooldown {
			Send(This.key)
			This.last_cast := A_Now
		}
	}

}

class Mode{
	belt := "f1"
	keys := [0]

	__New(belt,keys){
			This.belt:=belt
			This.keys:=keys
		}

	change(){
		Send This.belt
		for index, element in This.keys{
			Send element
			}
		return This
		}

	}


main := Gui()

main.Add("text",,"foo")

wizz_mode := Mode("{f1}",[0])
cleric_mode := Mode("{f2}",[9,0])
buffer_mode := Mode("{f3}",[9,0])

current_mode := wizz_mode

bless := Skill(main.AddCheckBox(,"Bless"),cleric_mode,2,1)
heal := Skill(main.AddCheckBox(,"Heal"),cleric_mode,6,1)
firebolt := Skill(main.AddCheckBox(,"FireBolt"),wizz_mode,1,3)
main.Show()


$F1::{
	firebolt.cast()
	}

$F2::{
	current_mode := cleric_mode.change()
	heal.cast()
	current_mode := wizz_mode.change()
	}

$F3::{
	buffer_mode.change()
	}

#f::{

	heal.cast()
	cleric_mode.change()
	bless.cast()
	wizz_mode.change()
	firebolt.cast()
}

