# comment single line
Write-Host "Hello from PowerShell!" # Write-Host ===> called cmdlet [verb-noun] to get all of them Get-Command
#Get-Command

# Write-Host always prints in new line
Write-Host "Hello again from PowerShell!!!" -NoNewline # -NoNewline parameter Write-Host of remove the new line
Write-Host "in same line"

# echo "Echoing Some text" # echo is an alias for Write-Output, which is used to send output to the pipeline
Write-Output "This is output text" # Write-Output sends output to the pipeline,

# which can be captured or processed by other cmdlets
# Get-Help Write-Output # Get-Help cmdlet provides information about other cmdlets

