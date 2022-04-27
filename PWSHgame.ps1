[int16]$global:oldheight
[int16]$global:oldwidth

[byte]$global:screenheight = 43
[byte]$global:screenwidth = 83

# these need to be stored in an array as part of each entity
[byte]$global:playery = 16
[byte]$global:playerx = 2
[string]$global:playerchar = "I"
[string]$global:playercolor = "red"

[bool]$global:localMap = $true

# symbol, background, foreground, tilename
$global:tileset = @(
    @("~~", "darkblue", "blue", "water"),
    @("´,", "green", "darkgreen", "grass"),
    @("@@", "green", "darkgreen", "trees"),
    @("⇞⇞", "green", "darkgreen", "pinetrees")
)

[string[]]$global:xaxis = @("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y")

[string[]]$global:yaxis = @("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25")

$global:world = @( #temp
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
)

$global:map = @( #temp
    @(0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),
    @(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0)
)

$global:grid = $global:map

[string[]]$global:sidebar = @(
    "sample sidebar line #1"
    "sample sidebar line #2"
    "sample sidebar line #3"
    "sample sidebar line #4"
    "sample sidebar line #5"
    "sample sidebar line #6"
    "sample sidebar line #7"
    "sample sidebar line #8"
    "sample sidebar line #9"
    "sample sidebar line #10"
    "sample sidebar line #11"
    "sample sidebar line #12"
    "sample sidebar line #13"
    "sample sidebar line #14"
    "sample sidebar line #15"
    "sample sidebar line #16"
    "sample sidebar line #17"
    "sample sidebar line #18"
    "sample sidebar line #19"
    "sample sidebar line #20"
    "sample sidebar line #21"
    "sample sidebar line #22"
    "sample sidebar line #23"
    "sample sidebar line #24"
    "sample sidebar line #25"
)

[string[]]$global:log = @(
    "sample log line #0"
    "sample log line #1"
    "sample log line #2"
    "sample log line #3"
    "sample log line #4"
    "sample log line #5"
    "sample log line #6"
    "sample log line #7"
    "sample log line #8"
    "sample log line #9"
)


Clear-Host


function DrawMenu([string]$ml1, [string]$ml2, [string]$ml3, [byte]$height, [byte]$width) #temp
{
    [float]$ml1_spaces = ($width - $ml1.Length) / 2 - 1
    [float]$ml2_spaces = ($width - $ml2.Length) / 2 - 1
    [float]$ml3_spaces = ($width - $ml3.Length) / 2 - 1
    [float]$blank_height = ($height - 3) / 2
    Write-Host ("X" + ("-" * ($width - 2)) + "X")
    if (($blank_height % 2) -ne 1) {
        for (($temp1 = $blank_height - 2); $temp1 -gt 0; $temp1 --) { Write-Host ("|" + (" " * ($width - 2)) + "|") }
    } else {
        for (($temp1 = $blank_height - 1); $temp1 -gt 0; $temp1 --) { Write-Host ("|" + (" " * ($width - 2)) + "|") }
    }
    Write-Host ("|" + (" " * [math]::Floor($ml1_spaces)) + $ml1 + (" " * [math]::ceiling($ml1_spaces)) + "|")
    Write-Host ("|" + (" " * [math]::Floor($ml2_spaces)) + $ml2 + (" " * [math]::ceiling($ml2_spaces)) + "|")
    Write-Host ("|" + (" " * [math]::Floor($ml3_spaces)) + $ml3 + (" " * [math]::ceiling($ml3_spaces)) + "|")
    for (($temp2 = $blank_height - 1); $temp2 -gt 0; $temp2 --) { Write-Host ("|" + (" " * ($width - 2)) + "|") }
    Write-Host ("X" + ("-" * ($width - 2)) + "X")
}

function Init() {
    if ($IsWindows -eq $true) { #only works in v6+ powershell core
        $phost = Get-Host
        $global:oldheight = $phost.ui.rawui.windowsize.height
        $global:oldwidth = $phost.ui.rawui.windowsize.width
        $phost.ui.rawui.windowsize.height = $global:screenheight
        $phost.ui.rawui.windowsize.width = $global:screenwidth
        Clear-Host
    }else {
        Clear-Host
        DrawMenu -ml1 "This game is intended to run on Windows in PWSH core v6+" -ml2 "Running it in other system configurations may cause unforseen bugs" -ml3 "Enter 'Yes' to proceed anyway or 'No' to exit" -height ($global:screenheight - 1) -width ($global:screenwidth)
        $agree = Read-Host "Acknowledge?"
        if($agree -eq "Yes") {
            return($true)
        }elseif ($agree -eq "No") {
            Quit
        }else {
            Init
        }
    }
}

function DrawGrid() {
    Write-Host "    A B C D E F G H I J K L M N O P Q R S T U V W X Y "
    Write-Host "   X--------------------------------------------------X X-------------------------X"
    for ($i = 1; $i -lt 26; $i++) {
        if ($i -lt 10) {
            Write-Host (("0" + [string]$i) + " |") -NoNewline
        } else {
            Write-Host ([string]$i + " |") -NoNewline
        }
        [byte]$yline = $i - 1
        [int16]$xsquare = -1
        if ($yline -eq $global:playery) {
            foreach ($gridsquare in $global:grid[$yline]) {
                $xsquare = ($xsquare + 1)
                if ($xsquare -eq $global:playerx) {
                    [string]$halftile = $global:tileset[$gridsquare][0].substring(0,1)
                    Write-Host $halftile -backgroundcolor $global:tileset[$gridsquare][1] -foregroundcolor $global:tileset[$gridsquare][2] -NoNewline
                    Write-Host $global:playerchar -backgroundcolor $global:tileset[$gridsquare][1] -foregroundcolor $global:playercolor -NoNewline
                } else {
                    Write-Host $global:tileset[$gridsquare][0] -backgroundcolor $global:tileset[$gridsquare][1] -foregroundcolor $global:tileset[$gridsquare][2] -NoNewline
                }
            }
        } else {
            foreach ($gridsquare in $global:grid[$yline]) {
                Write-Host $global:tileset[$gridsquare][0] -backgroundcolor $global:tileset[$gridsquare][1] -foregroundcolor $global:tileset[$gridsquare][2] -NoNewline
            }
        }
        Write-Host "" -NoNewline
        Write-Host "| | " -NoNewline
        [byte]$sidebarSpaces = (24 - $global:sidebar[$yline].Length)
        Write-Host ($global:sidebar[$yline] + (" " * $sidebarSpaces)) -NoNewline
        Write-Host "|"
    }
    Write-Host "   X--------------------------------------------------X X-------------------------X"
    Write-Host ""
    Write-Host "   X------------------------------------------------------------------------------X"
    for ($i = 0; $i -lt 10; $i++) {
        [byte]$logSpaces = (77 - $global:log[$i].Length)
        Write-Host ("   | " + ($global:log[$i] + (" " * $logSpaces))) -NoNewline
        Write-Host "|"
    }
    Write-Host "   X------------------------------------------------------------------------------X"
}

function Redraw() {
    Clear-Host
    Write-Host "   " -NoNewline
    Write-Host "Map State: " -NoNewline
    if ($global:mapstate -eq "local") {
        Write-Host "local" -foregroundcolor red -NoNewline
    }else {
        Write-Host "global" -foregroundcolor blue -NoNewline
    }
    Write-Host " " -NoNewline
    Write-Host "Player Location: " -NoNewline
    Write-Host ($global:xaxis[$global:playerx] + $global:yaxis[$global:playery]) -foregroundcolor green -NoNewline
    Write-Host ""
    DrawGrid
    Write-Host ""
}

function MovePlayer() { #debug
    Write-Host "   " -NoNewline
    [string]$newlocation = Read-Host "Enter new location in XYY format"
    [string]$newx = $newlocation.substring(0,1)
    [string]$newy = $newlocation.substring(1,2)
    $global:playerx = [array]::indexof($global:xaxis,$newx)
    $global:playery = [array]::indexof($global:yaxis,$newy)
}


function ToggleMap() {
    if ($global:localMap -eq $true) {
        $global:localMap = $false
        $global:grid = $global:world
    }else {
        $global:localMap = $true
        $global:grid = $global:map
    }
}

function GetTileset() { #debug
    Clear-Host
    Write-Host "tile test"
    foreach ($array in $global:tileset) {
        Write-Host $array[0] -backgroundcolor $array[1] -foregroundcolor $array[2] -NoNewline
        Write-Host (" " + $array[3])
    }
    Start-Sleep 5s
}

function Quit() {
    Clear-Host
    if ($IsWindows -eq $true) {
    $phost.ui.rawui.windowsize.height = $global:oldheight
    $phost.ui.rawui.windowsize.width = $global:oldwidth
    }
    break
}

function Prompt() {
    Write-Host "   " -NoNewline
    $command = Read-Host "Enter command"
    Redraw
    if($true) { #can set valid command list based on game state here (if gamestate -eq X -> if $command -eq cmdlist)
    $ScriptBlock = (get-item Function:\$command).ScriptBlock
    Invoke-Command -ScriptBlock $ScriptBlock
    }
    Redraw
}

Init
Redraw

while ($true) {
    Prompt
}

Exit
