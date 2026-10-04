#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false
isWaiting := false ; Biến để theo dõi xem có đang chờ bạn chọn phím để spam hay không

; F8: BẬT / TẮT Macro
F8::
    toggle := !toggle
    isWaiting := false ; Reset lại trạng thái chờ mỗi khi bật/tắt
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

; F12: TẮT Macro ngay lập tức
F12::
    toggle := false
    isWaiting := false
    Send {w up}{Shift up}{e up}{f up}{y up}
    ToolTip, MACRO: DA TAT (F12)
    SetTimer, RemoveToolTip, -1000
    Reload
return

; ================= PHÍM E =================
*$e::
    if (toggle) {
        if (!isWaiting) {
            ; 1. Đang chạy bình thường -> Bấm E để thả Shift+W và CHỈ BẤM 1 LẦN để nhận NV
            Send {w up}{Shift up}
            Send {e down}
            Sleep, 50
            Send {e up}
            
            isWaiting := true ; 2. Bật chế độ "CHỜ CẬU CHỌN PHÍM"
        } else {
            ; 3. Nếu đang ở chế độ chờ, và cậu bấm E -> Spam E
            isWaiting := false ; Tắt chế độ chờ
            Loop, 20 {
                if (!toggle)
                    break
                Send {e down}
                Sleep, 50
                Send {e up}
                Sleep, 50
            }
            if (toggle)
                Send {Shift down}{w down} ; Spam xong tự chạy tiếp
        }
    } else {
        Send {e}
    }
return

; ================= PHÍM F =================
*$f::
    if (toggle) {
        if (isWaiting) {
            ; 3. Nếu đang ở chế độ chờ, và cậu bấm F -> Spam F
            isWaiting := false ; Tắt chế độ chờ
            Loop, 20 {
                if (!toggle)
                    break
                Send {f down}
                Sleep, 50
                Send {f up}
                Sleep, 50
            }
            if (toggle)
                Send {Shift down}{w down} ; Spam xong tự chạy tiếp
        }
    } else {
        Send {f}
    }
return

; ================= PHÍM Y =================
*$y::
    if (toggle) {
        if (isWaiting) {
            ; 3. Nếu đang ở chế độ chờ, và cậu bấm Y -> Spam Y
            isWaiting := false ; Tắt chế độ chờ
            Loop, 20 {
                if (!toggle)
                    break
                Send {y down}
                Sleep, 50
                Send {y up}
                Sleep, 50
            }
            if (toggle)
                Send {Shift down}{w down} ; Spam xong tự chạy tiếp
        }
    } else {
        Send {y}
    }
return

RemoveToolTip:
    ToolTip
return
