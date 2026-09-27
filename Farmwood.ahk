#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false
inMenu := false  ; Biến kiểm tra trạng thái menu tương tác đã mở chưa

; F8: BẬT / TẮT Macro
F8::
    toggle := !toggle
    if (toggle) {
        inMenu := false
        ToolTip, MACRO: DANG BAT (Auto Shift + W)
        SetTimer, RemoveToolTip, -1000
        Send {Shift down}{w down}
    } else {
        inMenu := false
        ToolTip, MACRO: DA TAT
        SetTimer, RemoveToolTip, -1000
        Send {w up}{Shift up}
    }
return

; F12: TẮT Khẩn cấp (Hủy mọi hành động và reset)
F12::
    toggle := false
    inMenu := false
    Send {w up}{Shift up}{e up}{f up}{y up}
    ToolTip, MACRO: DA TAT (F12)
    SetTimer, RemoveToolTip, -1000
    Reload
return

; --- PHÍM E ---
*$e::
    if (toggle) {
        if (!inMenu) {
            ; LẦN 1: Thả Shift + W -> Bấm E mở Menu -> Chờ game hiện lựa chọn E/F/Y
            Send {w up}{Shift up}
            Send {e}
            inMenu := true
            Sleep, 400  ; Chờ 0.4s để game hiện bảng tùy chọn E/F/Y (có thể điều chỉnh nếu game lag)
        } else {
            ; LẦN 2: Bạn chọn E -> Spam E 20 lần -> Tự đè lại Shift + W
            SpamKey("e")
            inMenu := false
        }
    } else {
        Send {e}
    }
return

; --- PHÍM F ---
*$f::
    if (toggle) {
        if (inMenu) {
            ; Chọn F từ Menu -> Spam F 20 lần -> Tự đè lại Shift + W
            SpamKey("f")
            inMenu := false
        } else {
            ; Trường hợp bấm F trực tiếp ngoài menu
            Send {w up}{Shift up}
            Send {f}
            Sleep, 100
            SpamKey("f")
            inMenu := false
        }
    } else {
        Send {f}
    }
return

; --- PHÍM Y ---
*$y::
    if (toggle) {
        if (inMenu) {
            ; Chọn Y từ Menu -> Spam Y 20 lần -> Tự đè lại Shift + W
            SpamKey("y")
            inMenu := false
        } else {
            ; Trường hợp bấm Y trực tiếp ngoài menu
            Send {w up}{Shift up}
            Send {y}
            Sleep, 100
            SpamKey("y")
            inMenu := false
        }
    } else {
        Send {y}
    }
return

; Hàm thực hiện spam phím và tự động đè lại Shift + W khi hoàn thành
SpamKey(k) {
    global toggle
    Loop, 40 {
        if (!toggle)
            break
        Send {%k% down}
        Sleep, 50
        Send {%k% up}
        Sleep, 50
    }
    if (toggle) {
        Send {Shift down}{w down}
    }
}

RemoveToolTip:
    ToolTip
return
