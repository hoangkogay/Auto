#NoEnv
#SingleInstance Force
SetBatchLines -1

toggle := false
hasJob := false  ; Trạng thái: false = chưa nhận NV, true = đã nhận NV

; F8: BẬT / TẮT Macro
F8::
    toggle := !toggle
    hasJob := false
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

; Ký tự '*' giúp nhận phím kể cả khi đang giữ Shift
*$e::
    if (toggle) {
        if (!hasJob) {
            ; --- LẦN 1: Ấn E chỉ để kích hoạt nhận nhiệm vụ ---
            hasJob := true
            Send {w up}{Shift up}     ; Thả Shift và W ra
            Sleep, 50
            Send {e down}             ; Ấn E 1 lần
            Sleep, 50
            Send {e up}
            ; Lúc này game sẽ hiện nút E, F hoặc Y. Macro đứng chờ bạn ấn nút tiếp theo.
        } else {
            ; --- LẦN 2: Đã nhận NV -> Ấn E lần nữa sẽ spam 20 lần ---
            DoSpamLoop("e")
        }
    } else {
        Send {e}
    }
return

*$f::
    if (toggle) {
        if (hasJob) {
            DoSpamLoop("f")
        } else {
            Send {f}
        }
    } else {
        Send {f}
    }
return

*$y::
    if (toggle) {
        if (hasJob) {
            DoSpamLoop("y")
        } else {
            Send {y}
        }
    } else {
        Send {y}
    }
return

; Hàm thực hiện vòng lặp spam 20 lần và tự động chạy tiếp (Shift + W)
DoSpamLoop(key) {
    global hasJob
    Send {w up}{Shift up}         ; Đảm bảo thả Shift và W
    Sleep, 100
    Loop, 20 {
        Send % "{" key " down}"   ; Giữ phím (E/F/Y)
        Sleep, 50
        Send % "{" key " up}"     ; Thả phím
        Sleep, 450
    }
    hasJob := false               ; Reset lại trạng thái để điểm NV tiếp theo lặp lại quy trình
    Send {Shift down}{w down}     ; Tự động đè lại Shift + W để chạy tiếp
}

RemoveToolTip:
    ToolTip
return
