
$url = "https://vstsagentpackage.azureedge.net/agent/2.134.2/vsts-agent-win-x64-2.134.2.zip"

$toFilename = "$PSScriptRoot\agent.zip"

Invoke-WebRequest -uri $url -outfile $toFilename

$agentDir = "c:\agent"

if ((Test-Path $agentDir) -eq $false)
 {
 mkdir $agentDir
 }

cd $agentDir

Add-Type -AssemblyName System.IO.Compression.FileSystem

Write-Output "Starting to extract '$toFilename' to '$agentDir'..."
 [System.IO.Compression.ZipFile]::ExtractToDirectory($toFilename, "$PWD")

Write-Output "Agent has been extracted to '$agentDir'."

Write-Output ""

Write-Output "Run config.cmd to configure the agent."