function GetCompParametr() {
    $comp = Read-Host 'Enter computer name'
    $CPUandMaxClockSpeed = Get-WmiObject Win32_processor -ComputerName $($comp) | Format-List -Property MaxClockSpeed, Name
    $totalRAM = (Get-WmiObject Win3_2ComputerSystem -ComputerName $($comp)).totalPhysicalMemory / (1024*1024*1024)
    $freeRAM = (Get-WmiObject Win32_ComputerSystem -ComputerName $($comp)).freePhysicalMemory / 1mb
    $OSFreeDisk = (Get-WmiObject Win32_LogicalDisk -ComputerName $($comp) -Filter "DeviceID='C'").freeSpace / (1024*1024*1024)
    $OSVersion = Get-WmiObject Win32_OperatingSystem -ComputerName $($comp) | Select-Object Caption, Version
    $HotFix = Get-WmiObject -ClassName Win32_QuickFixEngineering -ComputerName $($comp)
    $StoppedProc = Get-WmiObject -Class Win32_Service -Filter "state='stopped" -ComputerName $($comp) | Select-Object name
    Write-Host  $CPUandMaxClockSpeed
}