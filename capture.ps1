# 
# powershell script to capture a specific display to a file, and then 
# set the desktop background of all monitors to display that file 
# 
# requires WallpaperChanger.exe (from https://github.com/philhansen/WallpaperChanger)
#
# (you can build WallpaperChanger.exe using visual studio)

param([Int32]$display = 2) 

[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

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

$last_filename = Get-Content $pwd\wallpaper-name.txt

$filename = "$pwd\wallpaper-display-" + $display.toString() + "-" + [System.IO.Path]::GetRandomFileName() + ".bmp"

CaptureDesktop  $filename 

.\WallpaperChanger.exe  $filename 0

Set-Content -Path  $pwd\wallpaper-name.txt -Value  $filename

if (Test-Path $last_filename) {
  remove-item $last_filename
}

 
