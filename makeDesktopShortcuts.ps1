$WorkingDirectory =  [System.IO.Path]::GetDirectoryName( $MyInvocation.MyCommand.Source )

Function createShortcut($displayNum, $hotkey, $Name, $usefile) {
    $DesktopDir = [Environment]::GetFolderPath("Desktop")
   
    if ($null -eq $Name) {
        $Name = "Capture Display $displayNum"
    }

    if ($null -eq $hotkey) {
        $hotkey = "CTRL+SHIFT+F$displayNum"
    }
    $ShortcutFile = $DesktopDir + "\" + $Name + ".lnk"

    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath = "PowerShell.exe"
    $Shortcut.WorkingDirectory = $WorkingDirectory
    if ($null -ne $usefile) {
        $Shortcut.Arguments = "-ExecutionPolicy bypass -file .\capture.ps1 -usefile $usefile"
    } else {
        $Shortcut.Arguments = "-ExecutionPolicy bypass -file .\capture.ps1 -display $displayNum"
    }
    $Shortcut.Hotkey = $hotkey 
    $Shortcut.WindowStyle = 7 # Minimized
    $Shortcut.Save()

}

$monitorCount = (Get-WmiObject win32_videocontroller | Select-Object caption, Current*Resolution | Where-Object -Property "CurrentHorizontalResolution" -GT 0).count

switch ($monitorCount) {
    0 { write-host "No monitors detected"}
    1 { createShortcut 1 "CTRL+SHIFT+F1" "Capture Display 1" }

    2 { createShortcut 1 "CTRL+SHIFT+F1" "Capture Display 1"
        createShortcut 2 "CTRL+SHIFT+F2" "Capture Display 2" }

    3 { createShortcut 1 "CTRL+SHIFT+F1" "Capture Display 1"
        createShortcut 2 "CTRL+SHIFT+F2" "Capture Display 2"
        createShortcut 3 "CTRL+SHIFT+F3" "Capture Display 3" }

    default { 
        createShortcut 1 "CTRL+SHIFT+F1" "Capture Display 1"
        createShortcut 2 "CTRL+SHIFT+F2" "Capture Display 2"
        createShortcut 3 "CTRL+SHIFT+F3" "Capture Display 3"
        createShortcut 4 "CTRL+SHIFT+F4" "Capture Display 4" 
    }
}

createShortcut 1 "CTRL+SHIFT+F11" "Set Default background" ".\default.png"
createShortcut 1 "CTRL+SHIFT+F12" "Set Random background" "random"
