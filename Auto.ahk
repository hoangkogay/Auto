#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false

; Nhấn F8 để BẬT / TẮT Macro (Tự đè Shift + W)
F8::
    toggle := !toggle
    if (toggle) {
        ToolTip, MACRO: DANG BAT (Dang de Shift + W)
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
            Send {e}              ; Nhấn phím E 20 lần
            Sleep, 20             ; Độ trễ 20ms giữa các lần nhấn
        }
        Send {Shift down}{w down} ; Đè lại Shift + W
    } else {
        Send e                    ; Nhấn E bình thường khi tắt macro
    }
return

; Khi bạn bấm phím F
$f::
    if (toggle) {
        Send {w up}{Shift up}     ; Tạm thời thả Shift và W
        Loop, 20 {
            Send {f}              ; Nhấn phím F 20 lần
            Sleep, 20
        }
        Send {Shift down}{w down} ; Đè lại Shift + W
    } else {
        Send f                    ; Nhấn F bình thường khi tắt macro
    }
return

; Khi bạn bấm phím Y
$y::
    if (toggle) {
        Send {w up}{Shift up}     ; Tạm thời thả Shift và W
        Loop, 20 {
            Send {y}              ; Nhấn phím Y 20 lần
            Sleep, 20
        }
        Send {Shift down}{w down} ; Đè lại Shift + W
    } else {
        Send y                    ; Nhấn Y bình thường khi tắt macro
    }
return

RemoveToolTip:
    ToolTip
return
