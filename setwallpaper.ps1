param([String]$filename) 

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

SetWallpaper $filename