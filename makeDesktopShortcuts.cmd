@echo off & (For /F Delims^= %%a In ('CertUtil -HashFile %0 SHA1^|FindStr /VRC:"[^a-f 0-9]"') Do Set "PS1=%TEMP%\%%a.ps1" )
(if not exist %PS1% more +3 %0 > %PS1%) & (PowerShell.exe -ExecutionPolicy bypass -file %PS1% %* & goto :EOF)
@@@@@@[ PowerShell Starts Here ]@@@@@@

Function createShortcut($displayNum, $hotkey, $Name) {
    $DesktopDir = [Environment]::GetFolderPath("Desktop") 
    $WorkingDirectory =  [System.IO.Path]::GetDirectoryName( $MyInvocation.MyCommand.Source )

    if ($Name -eq $null) {
        $Name = "Capture Display $displayNum"
    }

    if ($hotkey -eq $null) {
        $hotkey = "CTRL+SHIFT+F$displayNum"
    }
    $ShortcutFile = $DesktopDir + "\" + $Name + ".lnk"

    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath = "PowerShell.exe"
    $Shortcut.WorkingDirectory = $WorkingDirectory
    $Shortcut.Arguments = "-ExecutionPolicy bypass -file .\capture.ps1 -display $displayNum"
    $Shortcut.Hotkey = $hotkey 
    $Shortcut..WindowStyle = 7 # Minimized
    $Shortcut.Save()

}

$monitorCount = (GWMI win32_videocontroller | select caption, Current*Resolution | Where-Object -Property "CurrentHorizontalResolution" -GT 0).count

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
