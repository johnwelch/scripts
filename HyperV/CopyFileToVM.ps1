param(
    [string]$vmName,
    [string]$sourceFile,
    [string]$destinationFolder
)



$s = New-PSSession -VMName $vmName -Credential (Get-Credential)
Copy-Item -ToSession $s -Path $sourceFile -Destination $destinationFolder
Remove-PSSession $s