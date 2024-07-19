Param([Parameter(Mandatory=$false)][string]$hello='Hello',[Parameter(Mandatory=$false)][string]$world='World')
. .\src\windows\common\setup\init.ps1
# Rescue OS variable
$diska='c'

# FINDER FOR FAULTY OS DRIVE
$diskarray = "d","q","w","e","r","t","y","u","i","o","p","s","f","g","h","j","k","l","z","x","v","n","m"
$diskb="000"
foreach ($diskt in $diskarray)
{
   if (Test-Path -Path "$($diskt):\Windows")
   {
    $diskb=$diskt
    if (test-path "$($diskb):\windows\system32\drivers\Crowdstrike\C-00000291*.sys"){del "$($diskb):\windows\system32\drivers\Crowdstrike\C-00000291*.sys"}
    } 
}

# IN CASE OF FINDER FAILURE
if ($diskb -eq "000") {write-output "SCRIPT COULD NOT FIND A RESCUE OS DISK ATTACHED, EXITING";start-sleep 10;Exit}

return $STATUS_SUCCESS
