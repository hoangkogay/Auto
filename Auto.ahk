#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false

; Bấm F8 để BẬT / TẮT chế độ tự đè phím W
F8::
    toggle := !toggle
    if (toggle) {
        ToolTip, MACRO: DANG BAT (Dang de W)
        SetTimer, RemoveToolTip, -1000
        Send {w down}
    } else {
        ToolTip, MACRO: DA TAT
        SetTimer, RemoveToolTip, -1000
        Send {w up}
    }
return

; Khi bạn chủ động bấm phím E
$e::
    if (toggle) {
        Send {w up}       ; Tạm nhả phím W
        Loop, 20 {
            Send {e}      ; Nhấn E 20 lần
            Sleep, 20     ; Độ trễ 20ms
        }
        Send {w down}     ; Đè phím W trở lại
    } else {
        Send e            ; Khi chưa bật F8 thì phím E hoạt động bình thường
    }
return

; Khi bạn chủ động bấm phím F
$f::
    if (toggle) {
        Send {w up}       ; Tạm nhả phím W
        Loop, 20 {
            Send {f}      ; Nhấn F 20 lần
            Sleep, 20
        }
        Send {w down}     ; Đè phím W trở lại
    } else {
        Send f            ; Khi chưa bật F8 thì phím F hoạt động bình thường
    }
return

; Khi bạn chủ động bấm phím Y
$y::
    if (toggle) {
        Send {w up}       ; Tạm nhả phím W
        Loop, 20 {
            Send {y}      ; Nhấn Y 20 lần
            Sleep, 20
        }
        Send {w down}     ; Đè phím W trở lại
    } else {
        Send y            ; Khi chưa bật F8 thì phím Y hoạt động bình thường
    }
return

RemoveToolTip:
    ToolTip
return
