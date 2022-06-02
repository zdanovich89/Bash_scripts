function GetBiggestInt() { 
    [string]$data1 = Read-Host "Enter first number"
    [string]$data2 = Read-Host "Enter second number"
    $int1 = [int]$data1
    $int2 = [int]$data2
    
    if( $int1 -gt $int2) {
        Write-Host $int1
    }elseif ($int2 -gt $int1) {
        Write-Host $int2
    }else{
        Write-Host "They are equal"
    }
}

function IsLeapYear() {
    [int]$year = Read-Host "Enter year"
    if (!($year % 4) -and ($year % 100) -or !($year % 400)) {
        Write-Host 'It is leap year'
    }else{
        Write-Host "It is common year"
    }
}


function GetDivisors() {
    [int]$integer = Read-Host "Enter integer number"
    for($i = 1; $i -le $integer; $i++) {
        if(!($integer % $i)) {
            Write-Host $i
        }
    }
}

function GetSum() {  
    do {
        Write-Host "The second number must be greater than the first"
        [int]$n = Read-Host "Enter first number"
        [int]$m = Read-Host "Enter second number"
    } while ($m -le $n)
    $sum = 0
    for($i = $n; $i -le $m; $i++) {
        $sum+= $i
        $n++
    }        
    Write-Host $sum    
}

function GetFactorial() {
    do {        
        [int]$number = Read-Host "Enter natural number"
    } while ($number -le 0)   
    $i = 1
    $calc = $i
    while ($i -le $number) {
        $calc*= $i
        $i++ 
    }
    Write-Host $calc   
}

function GetSquare() {
    [array]$arrInput = @()
    do {
        $inputData = (Read-Host "Enter a number, if finished enter 'end'")
        if ($inputData -ne '') {
            $arrInput += $inputData                 
        }
    } until ($inputData -eq 'end')   
    $arrInput = $arrInput[0..($arrInput.Length-2)]    
    foreach($item in $arrInput) {
        $square = [int]$item * [int]$item
        Write-Host "Square of $($item) = $($square)"
    }
}

function GetSum() {
    [string]$data = Read-Host "Enter the numbers separated ';'"
    $array = $data.Split(";").Trim()
    $sum = 0
    foreach($item in $array) {
        if($item -ne 0){
            $sum+=$item
        }else{break}
    }
    Write-Host $sum
}

function GetExpression() {
    [int]$number = Read-Host "Enter a number greater than 0"
    $sum = 0
    $counter = 1
    if($number -gt 0){
        while($counter -le $number){
        $sum+= 3 * $counter
        $counter++
        Write-Host $sum
        }
    }else{Write-Host "Enter a number greater than 0"}       
}


function GetFileSize () {
    $path = Read-Host "Enter path"
    $extension = Read-Host "Enter extension, separated by commas if there is more than one"
    $extensionArr = $extension.Split(",").Trim()
    for ($i = 0; $i -lt $extensionArr.Count; $i++ ) {
        $sum = 0    
        $files = (Get-ChildItem $($path) -Recurse)        
        foreach($file in $files) {
            if($file.Name -cmatch "\.$($extensionArr[$i])+$"){
                $sum+= $file.length            
            } 
        }
         Write-Host "Total file size for $($extensionArr[$i])= $($sum/1Kb) Kb"
    }   
}

function GetServices() {
    $status = Read-Host "Enter 'Stopped' or 'Running'"
    $services = Get-Service
    foreach ($process in $services) {
        if($process.Status -match $status) {
            Write-Host "'$($process.Name)' process is $($process.Status)"
        }        
    }
}