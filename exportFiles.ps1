Get-ChildItem 'F:\YAUHEN\Powershell_Homework_files\Homework screenshots\homework_1' |
Export-Csv 'F:\YAUHEN\Powershell_Homework_files\homework.csv' -Delimiter ';'

Get-Volume | Export-Clixml 'F:\YAUHEN\Powershell_Homework_files\diskInfo.xml'

Import-Csv 'F:\YAUHEN\Powershell_Homework_files\homework.csv' -Delimiter ';' |
 ForEach-Object {if($_.length/1kb -gt 100) {
     Write-Host "File $($_.name) - $($_.length/1kb) kb" -ForegroundColor Red
 }else{ Write-Host "File $($_.name) - $($_.length/1kb) kb" -ForegroundColor Green}}

Import-Clixml 'F:\YAUHEN\Powershell_Homework_files\diskInfo.xml' | 
ForEach-Object{if($_.FileSystemType -eq "NTFS") {
    Write-Host "Driver $($_.DriveLetter)-file system $($_.FileSystemType)" -ForegroundColor Blue}
if($_.FileSystemType -eq "FAT32") {
    Write-Host "Driver $($_.DriveLetter)-file system $($_.FileSystemType)" -ForegroundColor Yellow} 
}