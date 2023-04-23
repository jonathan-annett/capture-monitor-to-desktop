# capture-monitor-to-desktop

This is a [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.3) script to capture the contents a windows display monitor directly to the desktop wallpaper.

It requires *WallpaperChanger.exe* (from https://github.com/philhansen/WallpaperChanger)

`WallpaperChanger.exe` is included in the repo, but you might prefer to build it yourself, indeed, depending on you windows security settings, you may need to do that before you can run the `WallpaperChanger.exe` file.

AutoHotKey script
===

how you invoke the powershell script is up to you, but if you happen to have [AutoHotKey](https://www.autohotkey.com/) installed on your computer, included is a script (capture.ahk) which will assign hotkeys to allow you to invoke the powershell script without exiting the current application.

The keys (which you can change by editing the script) are as follows:

ctrl-shift-F1 captures display 1

ctrl-shift-F2 captures display 2 

ctrl-shift-F3 captures display 3 (if you have one) 

ctrl-shift-F4 captures display 4 (if you have one) 

ctrl-shift-F11 sets the wallpaper to "default.png"

<img src="./default.png" width="384" height="216">

   - you can either update the default.png to your liking
   - or edit the script to specify an existing file)

   
ctrl-shift-F12 sets the wallpaper to a random picture from [Lorem Picsum](https://picsum.photos/) 

   - needs internet
      
      
      
But Why?
---
The relatively niche application of this script is for audio visual operators who wish to change the desktop of their computer to reflect a "holding slide" from a currently running powerpoint presentation.

Typically the operator would do this at the start of a session involving multiple presentations, choosing a slide that might be appropriate to use a as a "holding slide".

Since it's not always known ahead of time what that slide should be, this mechanism allows the operator to nominate that slide "on the fly" without interupting a running presentation.

Another reason you might do this is so you can exit powerpoint completely, leaving the extended desktop showing the current slide.

This allows the operator to open another file, or do something else without disturbing what's being displayed on the projection screen.


Building the WallpaperChanger.exe file
---
to do this you'll need [Microsoft's Visual Studio](https://visualstudio.microsoft.com/vs/community/) installed (the free community version is fine)

next you'll need to download the github project either by downloading the zipfile directly from [github](https://github.com/philhansen/WallpaperChanger/archive/refs/heads/master.zip) using your browser, or you may prefer to clone the repository using whatever tools you are familiar with, from `https://github.com/philhansen/WallpaperChanger.git`

once you have extracted the files onto your hard drive (or clone the repo), you can go ahead and double click on the `WallpaperChanger.sln` file, to open it in Visual Studio.


