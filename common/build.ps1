#!/usr/local/bin/pwsh
param(
	[switch]$MainOnly
)

. "$PSScriptRoot/_common.ps1"

SetBuildType

$target = "";
if($MainOnly)
{
	$target = "$MainTarget";
}

# Pull latest images 
docker pull microsoft/dotnet:2.2-aspnetcore-runtime
docker pull microsoft/dotnet:2.2-sdk

CleanDevFiles

$version = GetVersion

GetImageName

CrateDockerFile

return RunDockerCompose "build" $version $target


