Get-NetIPAddress | Format-Table

$user = get-credential
$servers = @("192.168.1.21", "192.168.1.22", "192.168.1.23")
Get-WmiObject win32_networkadapterconfiguration -ComputerName localhost |
Format-Table -Property Description, MACAddress


Get-WmiObject win32_networkadapterconfiguration -ComputerName $servers -credential $user | % {if($_.index -eq "1"){$_.enableDHCP()}}

New-SmbShare -Path F:\yauhen\ -Name "Shared Folder"

Remove-SmbShare -Name "Shared Folder"

Get-Command -Module hyper-v

Get-VM | % {switch ($_.State) {
    "running" {$color = "green"}  
    "stopping" {$color = "yellow"}
    "off" {$color = "red"}  
    }
    Write-Host $_.Name - $_.State -ForegroundColor $color
}


Stop-VM VM2_ZDANOVICH

New-VM VM4_ZDANOVICH

New-VHD -Dynamic -Path 'C:\Users\Public\Documents\Hyper-V\Virtual hard disks\VM4_ZDANOVICH.vhdx' -SizeBytes 5gb

Remove-VM VM4_ZDANOVICH