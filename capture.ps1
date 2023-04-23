# 
# powershell script to capture a specific display to a file, and then 
# set the desktop background of all monitors to display that file 
# 
param([Int32]$display = 2) 

[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

add-type  @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

function SetWallpaper ($filename) {
  $resolved = resolve-path $filename -errorAction silentlyContinue -errorVariable err
  
  if ($resolved) {
      [Win32.Wallpaper]::SetWallpaper("$resolved")
  }
}


function CaptureDesktop($path) {

  $screen = [System.Windows.Forms.Screen]::AllScreens;
  $num = 1;
     
  foreach ($item in $screen) {


    if ($num -eq $display) {

      $bounds1 = [Drawing.Rectangle]::FromLTRB($item.WorkingArea.X, $item.WorkingArea.Y, $item.Bounds.Width, $item.Bounds.Height);
      $bmp1 = New-Object Drawing.Bitmap $item.Bounds.Width, $item.Bounds.Height, Format24bppRgb;
      $graphics1 = [Drawing.Graphics]::FromImage($bmp1);

      $graphics1.CopyFromScreen($bounds1.Location, [Drawing.Point]::Empty, $item.Bounds.size);

      $bmp1.Save(  $path );  
      $graphics1.Dispose();
      $bmp1.Dispose();
      return
    }

    $num = $num + 1;
  }
}

if (Test-Path  $pwd\wallpaper-name.txt) {
      $last_filename = Get-Content $pwd\wallpaper-name.txt
} else {
      $last_filename =  "$pwd\nosuch.bmp"
}

$filename = "$pwd\wallpaper-display-" + $display.toString() + "-" + [System.IO.Path]::GetRandomFileName() + ".bmp"

CaptureDesktop  $filename 

SetWallpaper $filename

Set-Content -Path  $pwd\wallpaper-name.txt -Value  $filename

if (Test-Path $last_filename) {
  remove-item $last_filename
}

 