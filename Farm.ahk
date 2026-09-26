#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false

; F8: BẬT / TẮT Macro
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

; Ký tự '*' giúp nhận phím E kể cả khi đang giữ phím Shift
*$e::
    if (toggle) {
        Send {w up}{Shift up}     ; Thả Shift và W ra
        Sleep, 100
        Loop, 20 {
            Send {e down}         ; Giữ E
            Sleep, 50             ; Giữ 0.05s để GTA 5 kịp nhận phím
            Send {e up}           ; Thả E
            Sleep, 450            ; Chờ 0.45s (Tổng delay đúng 0.5s)
        }
        Send {Shift down}{w down} ; Đè lại Shift + W
    } else {
        Send {e}
    }
return

*$f::
    if (toggle) {
        Send {w up}{Shift up}     ; Thả Shift và W ra
        Sleep, 100
        Loop, 20 {
            Send {f down}
            Sleep, 50
            Send {f up}
            Sleep, 450
        }
        Send {Shift down}{w down} ; Đè lại Shift + W
    } else {
        Send {f}
    }
return

*$y::
    if (toggle) {
        Send {w up}{Shift up}     ; Thả Shift và W ra
        Sleep, 100
        Loop, 20 {
            Send {y down}
            Sleep, 50
            Send {y up}
            Sleep, 450
        }
        Send {Shift down}{w down} ; Đè lại Shift + W
    } else {
        Send {y}
    }
return

RemoveToolTip:
    ToolTip
return
