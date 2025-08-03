# Variables and Data Types in PowerShell

Write-Host "-------------------------------- Variables: `$ --------------------------------"

# Creating Variables
[string]$Name = "Aziz"
[int]$Age = 27
[bool]$IsStudent = $true
[double]$Height = 1.75
[int[]]$Scores = @(85, 90, 78)

Write-Host "Name: $Name"
Write-Host "Age: $Age"
Write-Host "Is Student: $IsStudent"
Write-Host "Height: $Height"
Write-Host "Scores: $($Scores -join ', ')"

# OR using New-Variable
New-Variable -Name "UserName" -Value "Aziz"
New-Variable -Name "UserAge" -Value 27
New-Variable -Name "IsItStudent" -Value $true
New-Variable -Name "UserHeight" -Value 1.75
New-Variable -Name "UserScores" -Value @(85, 90, 78)

# Setting variables with Set-Variable
Set-Variable -Name "Name" -Value "Bilel"
Set-Variable -Name "Age" -Value 30
Set-Variable -Name "IsStudent" -Value $false
Set-Variable -Name "Height" -Value 1.80
Set-Variable -Name "Scores" -Value @(88, 92, 80)

# Accessing Variables
Write-Host "Name: $Name"
Write-Host "Age: $Age"
Write-Host "Is Student: $IsStudent"
Write-Host "Height: $Height"
Write-Host "Scores: $($Scores -join ', ')"

# Objects
Write-Host "-------------------------------- Objects: --------------------------------"

# Creating a custom object using [PSCustomObject]
$Person = [PSCustomObject]@{
  Name     = "Aziz"
  Age      = 27
  IsStudent= $true
  Height   = 1.75
  Scores   = @(85, 90, 78)
}

Write-Host "Person Object:"
Write-Host "Name: $($Person.Name)"
Write-Host "Age: $($Person.Age)"
Write-Host "Is Student: $($Person.IsStudent)"
Write-Host "Height: $($Person.Height)"
Write-Host "Scores: $($Person.Scores -join ', ')"

# Creating an object using New-Object
$Car = New-Object PSObject -Property @{
  Make  = "Toyota"
  Model = "Corolla"
  Year  = 2022
  Color = "White"
}

Write-Host "Car Object:"
Write-Host "Make: $($Car.Make)"
Write-Host "Model: $($Car.Model)"
Write-Host "Year: $($Car.Year)"
Write-Host "Color: $($Car.Color)"


# Date & Time
Write-Host "-------------------------------- Date & Time: --------------------------------"



# Collections [Hash Tables, lists]
Write-Host "-------------------------------- Collections: --------------------------------"




# Enum
Write-Host "-------------------------------- Enum: --------------------------------"







# Get-Type / Get-Member
Write-Host "-------------------------------- Get-Type / Get-Member: --------------------------------"


