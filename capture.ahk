
; ctrl-shift-f1 captures display 3 to wallpaper
^+F1::{
    Run 'powershell.exe -ExecutionPolicy bypass -File capture.ps1 -display 1', ,"Hide"
}

; ctrl-shift-f2 captures display 3 to wallpaper
^+F2::{
    Run 'powershell.exe -ExecutionPolicy bypass -File capture.ps1 -display 2', ,"Hide"
}

; ctrl-shift-f3 captures display 3 to wallpaper
^+F3::{
    Run 'powershell.exe -ExecutionPolicy bypass -File capture.ps1 -display 3', ,"Hide"
}

; ctrl-shift-f4 captures display 4 to wallpaper
^+F4::{
    Run 'powershell.exe -ExecutionPolicy bypass -File capture.ps1 -display 4', ,"Hide"
}
