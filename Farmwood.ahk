#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false
waitingForChoice := false  ; Trạng thái chờ bạn bấm chọn phím E/F/Y

; F8: BẬT / TẮT Macro
F8::
    toggle := !toggle
    if (toggle) {
        waitingForChoice := false
        ToolTip, MACRO: DANG BAT (Auto Shift + W)
        SetTimer, RemoveToolTip, -1000
        Send {Shift down}{w down}
    } else {
        waitingForChoice := false
        ToolTip, MACRO: DA TAT
        SetTimer, RemoveToolTip, -1000
        Send {w up}{Shift up}
    }
return

; F12: TẮT Khẩn cấp (Reset toàn bộ)
F12::
    toggle := false
    waitingForChoice := false
    Send {w up}{Shift up}{e up}{f up}{y up}
    ToolTip, MACRO: DA TAT (F12)
    SetTimer, RemoveToolTip, -1000
    Reload
return

; --- PHÍM E ---
*$e::
    if (toggle) {
        if (!waitingForChoice) {
            ; LẦN 1: Bạn tự ấn E -> Thả Shift + W -> Gửi 1 phím E mở nhiệm vụ
            Send {w up}{Shift up}
            Send {e}
            waitingForChoice := true  ; Đã dừng chạy, chuyển sang chờ bạn chọn E/F/Y
        } else {
            ; LẦN 2: Bạn bấm chọn E -> Spam E 20 lần -> Tự đè lại Shift + W
            SpamKey("e")
        }
    } else {
        Send {e}
    }
return

; --- PHÍM F ---
*$f::
    if (toggle) {
        if (waitingForChoice) {
            ; Bạn bấm chọn F -> Spam F 20 lần -> Tự đè lại Shift + W
            SpamKey("f")
        } else {
            Send {f}
        }
    } else {
        Send {f}
    }
return

; --- PHÍM Y ---
*$y::
    if (toggle) {
        if (waitingForChoice) {
            ; Bạn bấm chọn Y -> Spam Y 20 lần -> Tự đè lại Shift + W
            SpamKey("y")
        } else {
            Send {y}
        }
    } else {
        Send {y}
    }
return

; Hàm thực hiện spam 20 lần và đè lại Shift + W khi hoàn thành
SpamKey(k) {
    global toggle, waitingForChoice
    Loop, 40 {
        if (!toggle)
            break
        Send {%k% down}
        Sleep, 50
        Send {%k% up}
        Sleep, 50
    }
    waitingForChoice := false
    if (toggle) {
        Send {Shift down}{w down}  ; Đè lại Shift + W để tiếp tục chạy
    }
}

RemoveToolTip:
    ToolTip
return
