#SingleInstance Force ; if someone starts the script twice, just replace it in memory

CaptureDisplay(displayNum) {
    Run Format("powershell.exe -ExecutionPolicy bypass -File capture.ps1 -display {1}", displayNum), , "Hide"
}

RandomDownload() {
    Download "https://picsum.photos/1920/1080?random", ".\downloaded.jpg"
    Run "powershell.exe -NoExit -ExecutionPolicy bypass -File setwallpaper.ps1 -filename .\downloaded.jpg", , "Hide"
}


SetWallpaperFile(filename) {
    Run Format("powershell.exe -ExecutionPolicy bypass -File setwallpaper.ps1 -filename {1}", filename), , "Hide"
}

; ctrl-shift-f1 captures display 3 to wallpaper
^+F1:: CaptureDisplay(1)

; ctrl-shift-f2 captures display 3 to wallpaper
^+F2:: CaptureDisplay(2)

; ctrl-shift-f3 captures display 3 to wallpaper
^+F3:: CaptureDisplay(3)

; ctrl-shift-f4 captures display 4 to wallpaper
^+F4:: CaptureDisplay(4)

; ctrl-shift-f11 downloads a random wallpaper
^+F11:: SetWallpaperFile(".\default.png")

; ctrl-shift-f12 downloads a random wallpaper
^+F12:: RandomDownload()
