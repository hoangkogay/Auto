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

; F12: TẮT Macro ngay lập tức (Dừng luôn vòng lặp đang chạy)
F12::
    toggle := false
    Send {w up}{Shift up}{e up}{f up}{y up}
    ToolTip, MACRO: DA TAT (F12)
    SetTimer, RemoveToolTip, -1000
    Reload
return

; Ký tự '*' giúp nhận phím E kể cả khi đang giữ phím Shift
*$e::
    if (toggle) {
        Send {w up}{Shift up}     ; Thả Shift và W ra
        Sleep, 100
        Loop, 20 {
            if (!toggle)
                break
            Send {e down}         ; Giữ E
            Sleep, 50             ; Giữ 0.05s để GTA 5 kịp nhận phím
            Send {e up}           ; Thả E
            Sleep, 50            ; Chờ 0.45s (Tổng delay đúng 0.5s)
        }
        if (toggle)
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
            if (!toggle)
                break
            Send {f down}
            Sleep, 50
            Send {f up}
            Sleep, 50
        }
        if (toggle)
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
            if (!toggle)
                break
            Send {y down}
            Sleep, 50
            Send {y up}
            Sleep, 50
        }
        if (toggle)
            Send {Shift down}{w down} ; Đè lại Shift + W
    } else {
        Send {y}
    }
return

RemoveToolTip:
    ToolTip
return
