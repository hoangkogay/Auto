#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false

; Bấm F8 để BẬT / TẮT Macro (Auto đè Shift + W)
F8::
    toggle := !toggle
    if (toggle) {
        ToolTip, MACRO: DANG BAT (Auto Shift + W)
        SetTimer, RemoveToolTip, -1000
        Send {Shift down}{w down}
    } else {
        ToolTip, MACRO: DA TAT
        SetTimer, RemoveToolTip, -1000
        Send {w up}{Shift up}
    }
return

; Khi bạn bấm phím E
$e::
    if (toggle) {
        Send {w up}{Shift up}     ; Tạm thời thả Shift và W
        Loop, 20 {
            Send {e}              ; Bấm E
            Sleep, 500            ; Delay 0,5 giây (500ms)
        }
        Send {Shift down}{w down} ; Tự đè lại Shift + W
    } else {
        Send e
    }
return

; Khi bạn bấm phím F
$f::
    if (toggle) {
        Send {w up}{Shift up}     ; Tạm thời thả Shift và W
        Loop, 20 {
            Send {f}              ; Bấm F
            Sleep, 500            ; Delay 0,5 giây (500ms)
        }
        Send {Shift down}{w down} ; Tự đè lại Shift + W
    } else {
        Send f
    }
return

; Khi bạn bấm phím Y
$y::
    if (toggle) {
        Send {w up}{Shift up}     ; Tạm thời thả Shift và W
        Loop, 20 {
            Send {y}              ; Bấm Y
            Sleep, 500            ; Delay 0,5 giây (500ms)
        }
        Send {Shift down}{w down} ; Tự đè lại Shift + W
    } else {
        Send y
    }
return

RemoveToolTip:
    ToolTip
return
