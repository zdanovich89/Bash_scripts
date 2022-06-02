function CheckNetworkMask {
    [Cmdletbinding()]
    Param(
        [Parameter(Mandatory)]
        [ValidateScript({$_ -match [IPAddress]$_})]
        [string]$firstIP,    
        [Parameter(Mandatory)]
        [ValidateScript({$_ -match [IPAddress]$_})]
        [string]$secondIP,
        [Parameter(Mandatory)]
        [ValidateScript({$_ -match '((\b(([01]?\d?\d|2[0-4]\d|25[0-5])\.){3}([01]?\d?\d|2[0-4]\d|25[0-5])\b)|\b([1-9]|[12][0-9]|3[02])\b)'})]
        [string]$subnetMask     
)
    if ($subnetMask -match '\b([1-9]|[12][0-9]|3[02])\b'){
        $mask = ([Math]::Pow(2, $subnetMask) - 1) * [Math]::Pow(2, (32 - $subnetMask))
        $bytes = [BitConverter]::GetBytes([UInt32] $mask)
        $subnetMask = (($bytes.Count - 1)..0 | ForEach-Object { [String] $bytes[$_] }) -join "."  
    }

    $net1 = [IPAddress] (([IPAddress] $firstIP).Address -band ([IPAddress] $subnetMask).Address)
    $net2 = [IPAddress] (([IPAddress] $secondIP).Address -band ([IPAddress] $subnetMask).Address)   
    Write-Host $(If ($net1 -eq $net2) {"Network for first IP = $net1, network for second IP = $net2. They are on the same network"}
        else {"Network for first IP = $net1, network for second IP = $net2. They are on the different networks"})
}