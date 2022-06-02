function GetProcessInformation($processName) {
    $processCPU = (Get-Process -Name $processName).CPU
    $startTime = (Get-Process -Name $processName).StartTime
    $processPath = (Get-Process -Name $processName).Path
    return "CPU usage = $processCPU,
     Start time = $startTime, 
     Path to process :$processPath"
}