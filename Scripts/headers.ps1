<#
.SYNOPSIS
    This script sets up the headers for the PowerShell scripts in the project.


.DESCRIPTION
    It includes metadata such as the script name, author, creation date, and a brief description of the script's purpose.

.PARAMETER ScriptName
    The name of the script for which the header is being created.

.PARAMETER Author
    The name of the author of the script.
.PARAMETER CreationDate
    The date when the script was created.
.EXAMPLE
    headers.ps1 -ScriptName "ExampleScript.ps1" - Author "Yahyaoui Aziz" -CreationDate "2023-10-01"

.VERSION
    1.0.0

.NOTES
    This script is part of the project to standardize script headers for better documentation and maintainability.

.LINK
    www.example.com/project-documentation

#>


param (
  
  [string]$ScriptName,
  [string]$Author,
  [string]$CreationDate
)

Write-Output "Script: $ScriptName"
Write-Output "Author: $Author"
Write-Output "Created On: $CreationDate"
