function Get-Number{
    param(
        [parameter(Mandatory)]
        [ValidateRange(1,9999999999)]
        [int]$A,
        [parameter(Mandatory)]
        [ValidateRange(1,9999999999)]
        [int]$B,
        [parameter(Mandatory=$false)]
        [int]$N = '3',
        [parameter(Mandatory=$false)]
        [switch]$remainder
      
    )
    [array]$arr =$A..$B 
    if(!$remainder){foreach($item in $arr){
        if(!($item % $N)){
            Write-Host $item
        }
    }}
    if($remainder){foreach($item in $arr){
        if($item % $N){
            Write-Host $item
        }
    }}
}