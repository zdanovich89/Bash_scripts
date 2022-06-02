Get-WmiObject -List -ComputerName localhost

Get-WmiObject -Namespace Root -Class __NameSpace

Get-WmiObject -Class Win32_Printer

Get-CimInstance -Class Win32_Printer

Get-WmiObject -List *printer*

Get-WMIObject win32_operatingsystem | Select-Object CSName, SerialNumber, SizeStoredInPagingFiles, 
Version, TotalVirtualMemorySize, TotalVisibleMemorySize, SystemDevice, 
OSLanguage, OSArchitecture, Status


Get-WmiObject -Class Win32_BIOS

function Get-DriveInformation(){    
    Get-WmiObject win32_logicaldisk |      
    % {Write-Host "Drive $($_.name) free space-$($_.FreeSpace/1gb) GB"}
    Get-WmiObject win32_logicaldisk | Measure-Object -Property FreeSpace -Sum |
    % {Write-Host "Total free space - $($_.sum/1gb) GB"}
}

$ComputerName = 'google.com'
$TimeoutMillisec = 2000

Get-WmiObject -Class Win32_PingStatus -Filter "Address='8.8.8.8'" -ComputerName localhost

function Get-PingTime () {
    param(
        [parameter(Mandatory, HelpMessage="Enter IP-address")]
        [ValidatePattern("^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$")]
        $address,
        [parameter(Mandatory)]
        $computerName,
        [parameter(Mandatory)]
        [ValidateRange(1,20)]
        $packets
    )    
    $totalPingTime = 0    
    for($i = 0; $i -lt $packets; $i++) {
        Get-WmiObject -Class Win32_PingStatus -Filter "Address='$address'" -ComputerName $computerName |
         % {$totalPingTime+=$_.ResponseTime}
    }
    Write-Host "Total response time for $packets packets = $totalPingTime ms"
}

Register-WmiEvent -query "select * from __instancecreationevent within 5 where targetinstance isa 'Win32_Process' and targetinstance.name='winword.exe'" -sourceIdentifier "ProcessStarted" -Action { Write-Host "MS Word is running" }