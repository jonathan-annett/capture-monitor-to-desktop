# capture-monitor-to-desktop

This is a [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.3) script to capture the contents a windows display monitor directly to the desktop wallpaper.

Arguments
===
the script expects the arguments "-display n" where n is the display number

Examples
===
  - `.\capture.cmd 1` will capture display 1
  - `.\capture.cmd 2` will capture display 2
  - `.\capture.cmd 0 random` will set a random wallpaper
  - `.\capture.cmd 0 D:\mywallpaper.bmp` will set an existing file
  
 
Examples (Direct invocation of powershell script)
===
  - `powershell.exe -ExecutionPolicy bypass -File capture.ps1 -display 1` will capture display 1
  - `powershell.exe -ExecutionPolicy bypass -File capture.ps1 -display 2` will capture display 2
  - `powershell.exe -ExecutionPolicy bypass -File capture.ps1 -usefile random` will set a random wallpaper
  - `powershell.exe -ExecutionPolicy bypass -File capture.ps1 -usefile D:\mywallpaper.bmp` will set an existing file

Windows Shortcuts With Hotkeys
===

How you invoke the powershell script is up to you, but for your convenience`makeDesktopShortcuts.cmd` will create desktop shortcuts with hotkeys to capture each monitor, without the need to install a hotkey manager like AutoHotKey. see the AutoHotKey section below for a list of keys (this script defines the same keys)

AutoHotKey script
===

How you invoke the powershell script is up to you, but if you happen to have [AutoHotKey](https://www.autohotkey.com/) installed on your computer, included is a script (capture.ahk) which will assign hotkeys to allow you to invoke the powershell script without exiting the current application.

The keys (which you can change by editing the script) are as follows:

ctrl-shift-F1 captures display 1

ctrl-shift-F2 captures display 2 

ctrl-shift-F3 captures display 3 (if you have one) 

ctrl-shift-F4 captures display 4 (if you have one) 

ctrl-shift-F11 sets the wallpaper to "default.png"

<img src="./default.png" width="384" height="216">

   - you can either update the default.png to your liking
   - or edit the script to specify an existing file


ctrl-shift-F12 sets the wallpaper to a random picture from [Lorem Picsum](https://picsum.photos/) 

   - needs internet
      
      
      
But Why?
---
The relatively niche application of this script is for audio visual operators who wish to change the desktop of their computer to reflect a "holding slide" from a currently running PowerPoint presentation.

Typically an operator would do this at the start of a session involving multiple presentations, choosing a slide that might be appropriate to use as a "holding slide".

Since it's not always known ahead of time what that slide should be, this mechanism allows the operator to nominate that slide "on the fly" without interupting a running presentation.

Another reason you might do this is so you can exit PowerPoint in the middle of a presentation, leaving the extended desktop showing the current slide.

This allows the operator to open another file, or do something else without disturbing what's being displayed on the projection screen.

Operational Note
---

It's expected that the operator understand which monitor is being used for the extended display, and which is the primary display. 

Whilst it could be assumed that 1 is the primary and 2 is the extended, this is not always the case, so it is strongly suggested the operator have done a "test run" in advance to know which display to capture, to avoid the unfortunate scenario where the desktop is set to display a presenter view screen, or some other application that happens to be open on the display being captured.

Attribution
---

Portions of this repository are based on code found here https://techexpert.tips/powershell/powershell-configure-wallpaper/

