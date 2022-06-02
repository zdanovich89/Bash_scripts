function UpdateData {
    [Cmdletbinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$path, 
        [Parameter(Mandatory)]
        [string]$path_to_save 
    )

    [array]$emails_arr = '' 
    $people_list = Import-Csv -Path $path 
    $people_list | ForEach-Object { 
        $TextInfo = (Get-Culture).TextInfo        
        $_.name = $TextInfo.ToTitleCase($_.name)               
        $_.email = $($_.name.split(" ")[0].Substring(0, 1) + $_.name.split(" ")[1] + '@abc.com') 
        $_.email = $TextInfo.ToLower($_.email)               
        if ($_.email -in $emails_arr) { 
            $_.email = $($_.name.split(" ")[0].Substring(0, 1) + $_.name.split(" ")[1] + $_.location_id + '@abc.com')  
            $_.email = $TextInfo.ToLower($_.email)
        }

        $emails_arr += $_.email          
    }

    $people_list | ConvertTo-Csv -NoTypeInformation | % { $_.Replace('"', '') } | Out-File $path_to_save 

}