param(
    [parameter(Mandatory)]
    $fileName,
    [parameter(Mandatory)]
    $filePath,
    [parameter(Mandatory)]
    $numberServices,
    $order = 'last'    
)
if($order -eq 'last') {
    Get-Service | Where-Object {$_.Status -eq 'running'} | 
    Select-Object -last $numberServices |
    Out-File $filePath/$fileName
}
if($order -eq 'first') {
    Get-Service | Where-Object {$_.Status -eq 'running'} | 
    Select-Object -first $numberServices |
    Out-File $filePath/$fileName
}
Get-Content $filePath/$fileName
