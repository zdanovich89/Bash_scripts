Get-ChildItem -Path HKCU:\
New-Item -ItemType "directory" -path "C:\PS_ZDANOVICH"
New-PSDrive -Name "PS_Zdanovich" -Root "C:\PS_ZDANOVICH" -PSProvider "Filesystem"
New-Item -Path . -Name Test_Folder -ItemType "directory"
Rename-Item -Path "PS_Zdanovich:\Test_Folder" -NewName "New_Test_Folder"
Remove-Item -Path "PS_Zdanovich:\New_Test_Folder"

Get-Service | Where-Object {$_.Status -eq 'running'} | Out-File -FilePath "PS_Zdanovich:\services.txt"
Get-Content -Path "PS_Zdanovich:\services.txt"



$parametrs = @{
    Name = "PS_Zdanovich"
    PSProvider = "FileSystem"
    Root = "C:\PS_ZDANOVICH"
}

Get-ChildItem 'C:\PS_ZDANOVICH' | Export-Clixml 'F:\YAUHEN\Powershell Homework files\homework.xml'


Add-Content 'C:\PS_zdanovich\logs.txt' -Value 'some new data........'
Add-Content 'C:\PS_zdanovich\services.txt' -Value 'some new data........'

Import-Clixml 'F:\YAUHEN\Powershell Homework files\homework.xml'

 Compare-Object -ReferenceObject (Import-Clixml 'F:\YAUHEN\Powershell Homework files\homework.xml') `
 -DifferenceObject (Get-ChildItem C:\PS_ZDANOVICH) -Property LastWriteTime -PassThru |`
  % {Write-Output $_.name} | Select-Object -Unique


 Get-Volume | ConvertTo-Json | Out-File C:\PS_ZDANOVICH\disk_info.json

 Get-Content C:\PS_ZDANOVICH\disk_info.json

 $(Get-Content C:\PS_ZDANOVICH\disk_info.json | ConvertFrom-Json) |`
  % {Write-Host " Drive : $($_.driveletter) free space - $($_.SizeRemaining/1mb) Mb`
  ($([math]::Round($(($_.SizeRemaining) / $($_.size / 100)), 2))%)"}



  Get-EventLog -LogName Application -After (Get-Date).AddDays(-7) | Export-Csv C:\PS_ZDANOVICH\zdanovich.csv -Delimiter ';'









  Import-Csv C:\PS_ZDANOVICH\zdanovich.csv -Delimiter ';' | % { 
    if($_.EntryType -eq 'Information'){
       Write-host `
       "Time generated:$($_.TimeGenerated)
        Message:$($_.Message)"
    }
    if($_.EntryType -eq 'Warning'){
       Write-host `
       "Time generated:$($_.TimeGenerated)
        Message:$($_.Message)" -ForegroundColor Yellow
    }
    if($_.EntryType -eq 'Error'){
       Write-host `
       "Time generated:$($_.TimeGenerated)
        Message:$($_.Message)"-ForegroundColor Red
    }
  }


