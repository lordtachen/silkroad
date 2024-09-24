; Main Config
SendMode "Event"
SetKeyDelay(50, 50)

; Globals
EQUIP_DELAY := 200

;Init
bToggle := false
windowTitle := "foo.exe"
windowControl := "foo"

; -----------------------
F9:: {
    global bToggle
    global t_state
    bToggle := !bToggle
    If bToggle{
        t_state.Text := "ON"
        SetTimer(TheLoop, 1000) ; This is 1000 ms
    }
    else{

        t_state.Text := "OFF"
        SetTimer(TheLoop, -1)
    }

}
TheLoop() {
    if bToggle{
        SelectTarget()
        for i, val in loopCheckBoxes {
            if val.value
                SendTo(val.Text)
            }
        }

}
; ---------------------
~$F1:: {
    SendTo("{F1}")
    SendTo("0")
    Sleep(EQUIP_DELAY)
}
; --------------------
~$F2::{

    SendTo("9")
    Sleep(EQUIP_DELAY)
    SendTo("0")
}

-:: {
    SendTo("{LShift down}")
    Click
    SendTo("{LShift up}")
    SendTo("{Enter}")
    }

+:: {
    global windowTitle
    global windowControl
    windowTitle := WinGetTitle("A")
    windowControl := ControlGetFocus(windowTitle)

    global windowInfo
    t := windowTitle ":" windowControl
    windowInfo.Length := StrLen(t)
    windowInfo.Text := t

    }
; --------------------

SelectTarget(){
    if rb_targetPlayer.value
        SelectPlayer1()
    if rb_targetSupport.value
        TargetSupport()
    if rb_targetEnemy.value
        SendTo("{LCtrl}")
    }

SelectPlayer1() {
    SendTo("{LCtrl down}")
    SendTo("2")
    SendTo("{LCtrl up}")
    }
TargetSupport() {
    SelectPlayer1()
    SendTo("l")
}

SendTo(k){
    if cb_sentTo.value{
        global windowTitle
        global windowControl
        ControlSend(k,,"Tachen")
    }
    else
        Send(k)
    }

; If you plan to use the GUI, here's how to initialize it in v2
; Create the GUI
myGui := Gui("+Resize +MinSize200x100","Generic Skill loop")
loopkeys := ["1","2","3","4","5","6","7","8","9"]
loopCheckBoxes := []
loopCheckBoxes.Length := 9

myGui.AddText(, "State:")
t_state := myGui.AddText("w200", "Init")

myGui.AddText(, "Target Method:")
rb_targetManual := myGui.AddRadio(,"Manual")
rb_targetManual.value := 1
rb_targetPlayer := myGui.AddRadio(,"Player")
rb_targetSupport := myGui.AddRadio(,"TargetSupport")
rb_targetEnemy := myGui.AddRadio(,"Enemy")

; Skills
myGui.AddText(, "MainLoop:")
for i, val in loopKeys {
    loopCheckBoxes[i] := myGui.AddCheckBox(,val)
    }

myGui.AddText(,"Window Options")
cb_sentTo := myGui.AddCheckBox(,"Send To Specific Window")

myGui.AddText(,"Window:Control")
windowInfo := myGui.AddText("w200","None")
; Show the GUI
myGui.Show()

myGui.OnEvent("Close", (*) => ExitApp())
