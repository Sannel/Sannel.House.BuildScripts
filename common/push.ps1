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

$version = GetVersion

GetImageName

return RunDockerCompose "push" $version $target


