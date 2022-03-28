[int16]$global:oldheight
[int16]$global:oldwidth

[byte]$global:screenheight = 43
[byte]$global:screenwidth = 83

[byte]$global:value = 1
[byte]$global:number = 2
[string]$global:gamestate

[byte]$global:globalpixel = 1
[byte]$global:localpixel = 1

[string]$global:mapstate = "local"

$global:tileset = @(
    @("~~", "darkblue", "blue"), #0, water
    @("´,", "green", "darkgreen"), #1, grass
    @("@@", "green", "darkgreen"), #3, trees
    @("⇞⇞", "green", "darkgreen") #4, pinetrees
)

$global:world = @(
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

$global:grid = @(
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

[string[]]$global:screen_static = @(
    "    A B C D E F G H I J K L M N O P Q R S T U V W X Y "
    "   X--------------------------------------------------X X-------------------------X"
    "01 |<0>| |<stat0>|"
    "02 |<1>| |<stat1>|"
    "03 |<2>| |<stat2>|"
    "04 |<3>| |<stat3>|"
    "05 |<4>| |<stat4>|"
    "06 |<5>| |<stat5>|"
    "07 |<6>| |<stat6>|"
    "08 |<7>| |<stat7>|"
    "09 |<8>| |<stat8>|"
    "10 |<9>| |<stat9>|"
    "11 |<10>| |<stat10>|"
    "12 |<11>| |<stat11>|"
    "13 |<12>| |<stat12>|"
    "14 |<13>| |<stat13>|"
    "15 |<14>| |<stat14>|"
    "16 |<15>| |<stat15>|"
    "17 |<16>| |<stat16>|"
    "18 |<17>| |<stat17>|"
    "19 |<18>| |<stat18>|"
    "20 |<19>| |<stat19>|"
    "21 |<20>| |<stat20>|"
    "22 |<21>| |<stat21>|"
    "23 |<22>| |<stat22>|"
    "24 |<23>| |<stat23>|"
    "25 |<24>| |<stat24>|"
    "   X--------------------------------------------------X X-------------------------X"
    ""
    "   X------------------------------------------------------------------------------X"
    "   |<log0>|"
    "   |<log1>|"
    "   |<log2>|"
    "   |<log3>|"
    "   |<log4>|"
    "   |<log5>|"
    "   |<log6>|"
    "   |<log7>|"
    "   |<log8>|"
    "   |<log9>|"
    "   X------------------------------------------------------------------------------X"
)

$global:screen_current = @()
$global:screen_current = $global:screen_current + $global:screen_static


Clear-Host


function DrawMenu([string]$ml1, [string]$ml2, [string]$ml3, [byte]$height, [byte]$width)
{
    [float]$ml1_spaces = ($width - $ml1.Length) / 2 - 1
    [float]$ml2_spaces = ($width - $ml2.Length) / 2 - 1
    [float]$ml3_spaces = ($width - $ml3.Length) / 2 - 1
    [float]$blank_height = ($height - 3) / 2
    Write-Host ("X" + ("-" * ($width - 2)) + "X")
    if (($blank_height % 2) -ne 1)
    {
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

function Init()
{
    $global:gamestate = "init"
    if ($IsWindows -eq $true) #only works in v6+ powershell core, otherwise returns false (need to add check for blue powershell, too)
    {
        $phost = Get-Host
        $global:oldheight = $phost.ui.rawui.windowsize.height
        $global:oldwidth = $phost.ui.rawui.windowsize.width
        $phost.ui.rawui.windowsize.height = $global:screenheight
        $phost.ui.rawui.windowsize.width = $global:screenwidth
        Clear-Host
        Write-Host "Game State: $global:gamestate"
        Write-Host ""
        DrawMenu -ml1 "Your system configuration is fully supported" -ml2 "The size of your PWSH window has been adjusted" -ml3 "The game will start shortly..." -height ($global:screenheight - 3) -width ($global:screenwidth)
        Write-Host ""
        Start-Sleep -Seconds 5
    }else {
        Clear-Host
        Write-Host "Game State: $global:gamestate"
        Write-Host ""
        DrawMenu -ml1 "Your OS or PowerShell version is not supported" -ml2 "Do you wish to attempt to run the script anyway?" -ml3 "Enter 'Yes' to proceed or 'No' to exit" -height ($global:screenheight - 3) -width ($global:screenwidth)
        $agree = Read-Host "Acknowledge?"
        if($agree -eq "Yes")
        {
            return($true)
        }elseif ($agree -eq "No")
        {
            Quit
        }else
        {
            Init
        }
    }
}

function MapGrid()
{
    $global:screen_current = @()
    $global:screen_current = $global:screen_current + $global:screen_static
    if ($global:mapstate -eq "local")
    {
        for ($i = 2; $i -ne 27; $i++) {
            $x = ($i - 2)
            $global:screen_current[$i] = ($global:screen_current[$i].replace("<$x>",($global:grid[$x] + "")))
            [byte]$global:sidebar_spaces = (24 - $global:sidebar[$x].Length)
            $global:screen_current[$i] = ($global:screen_current[$i].replace("<stat$x>"," " + ($global:sidebar[$x] + (" " * $global:sidebar_spaces))))
        }
    }else
    {
        for ($i = 2; $i -ne 27; $i++) {
            $x = ($i - 2)
            $global:screen_current[$i] = ($global:screen_current[$i].replace("<$x>",($global:world[$x] + "")))
            [byte]$global:sidebar_spaces = (24 - $global:sidebar[$x].Length)
            $global:screen_current[$i] = ($global:screen_current[$i].replace("<stat$x>"," " + ($global:sidebar[$x] + (" " * $global:sidebar_spaces))))
        }
    }
    for ($i = 30; $i -ne 40; $i++) {
        $x = ($i - 30)
        [byte]$global:log_spaces = (77 - $global:log[$x].Length)
        $global:screen_current[$i] = ($global:screen_current[$i].replace("<log$x>"," " + ($global:log[$x] + (" " * $global:log_spaces))))
    }
}

function Redraw()
{
    $global:gamestate = "map"
    Clear-Host
    Write-Host "   " -nonewline
    #Write-Host "Game State: $global:gamestate, Value = $global:value, Number = $global:number"
    Write-Host "Map State: " -nonewline
    if ($global:mapstate -eq "local")
    {
        Write-Host "local" -foregroundcolor red
    }else{
        Write-Host "global" -foregroundcolor blue
    }
    Write-Host ""
    MapGrid
    foreach ($element in $global:screen_current) {
        Write-Host $element
    }
    Write-Host ""
}

function SetValue() #debug
{
    $global:value = Read-Host "New value"
}

function SetNumber() #debug
{
    $global:number = Read-Host "New number"
}

function ToggleMap()
{
    if ($global:mapstate -eq "local")
    {
        $global:mapstate = "world"
    }else
    {
        $global:mapstate = "local"
    }
}

function GetTileset() #debug
{
    Clear-Host
    Write-Host "tile test"
    foreach ($array in $global:tileset) {
        Write-Host $array[0] -backgroundcolor $array[1] -foregroundcolor $array[2]
    }
    Start-Sleep 5s
}

function Quit()
{
    Clear-Host
    if ($IsWindows -eq $true)
    {
    $phost.ui.rawui.windowsize.height = $global:oldheight
    $phost.ui.rawui.windowsize.width = $global:oldwidth
    }
    break
}

function Prompt()
{
    Write-Host "   " -nonewline
    $command = Read-Host "Enter command"
    Redraw
    if($true) #can set valid command list based on game state here (if gamestate -eq X -> if $command -eq cmdlist)
    {
    $ScriptBlock = (get-item Function:\$command).ScriptBlock
    Invoke-Command -ScriptBlock $ScriptBlock
    }
    Redraw
}

Init
Redraw

while ($true)
{
    Prompt
}

Exit

# ideas so far:
# store level as text file imported into string, with numeric values corresponding to terrain type
# can use leters or special characters to set visibly identical tiles but with guaranteed spawn chances of objects
# 2 layers: terrain is background color which defines pixel properties, then objects are rendered as text on top
# global 25x25 pixel map, where each pixel corresponds to a 25x25 playable area (for a total of 625x625 pixels)
# player moves within playable area, walking into border loads next playable area & switches global location
# enemies load semi-randomly in each unexplored area- explored ares are stored in savegame folder with enemy count remaining
# enemies are stored as variables with their coordinates attached (fake objects)
# X number of player action points, action commands will do X = X-1, if X -eq 0 then return error message
# reset action points, update enemy coordinates on turn end command to be displayed on full screen redraw

# to-do:
# import grid from text file
# map tileset to grid
# function to move log messages
# player sprite & movement
# function to convert coordinate format (A1-Y25) to number format (1-625) and back