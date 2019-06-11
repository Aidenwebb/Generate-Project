function New-Project {
<#
.SYNOPSIS

.DESCRIPTION

.NOTES

.INPUTS

.OUTPUTS

.PARAMETER ProjectName

.PARAMETER ProjectBasePath

.EXAMPLE
#>

param(
    [parameter(Mandatory=$true, Position=0)][string]$ProjectName,
    [parameter(Mandatory=$true, Position=1)][string]$ProjectBasePath
)
#$ProjectName = "Project-Generator"
#$ProjectBasePath = "C:\Users\aarnkels-webb\github\Projects"

# Create Project Directory
New-Item -Path $ProjectBasePath\$ProjectName -ItemType Directory

# Create Source directory
New-Item -Path $ProjectBasePath\$ProjectName\src -ItemType Directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName -ItemType Directory


# Create Tests directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName.unittests -ItemType Directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName.integrationtests -ItemType Directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName.integrationtests\Stories -ItemType Directory


# Create Resources directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName.resources -ItemType Directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName.resources\helpers -ItemType Directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName.resources\helpers\functions -ItemType Directory
New-Item -Path $ProjectBasePath\$ProjectName\src\$ProjectName.resources\tools -ItemType Directory
"This Folder is for 3rd party exe's, dlls etc" | Out-File $ProjectBasePath\$ProjectName\src\$ProjectName.resources\tools\Readme.md
}