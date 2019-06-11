function New-CodeProject {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES

    .INPUTS

    .OUTPUTS

    .PARAMETER Name

    .PARAMETER BasePath

    .PARAMETER Description

    .EXAMPLE
    #>
    param(
        [parameter(Mandatory=$true, Position=0)][string]$Name,
        [parameter(Mandatory=$true, Position=1)][string]$BasePath,
        [parameter(Mandatory=$false, Position=1)][string]$Description
    )
    
    Import-Module .\src\generate-project\New-CodeProjectDirectoryTree.psm1

    #$Name = "Project-Generator"
    #$BasePath = "C:\Users\aarnkels-webb\github\Projects"

    New-CodeProjectDirectoryTree -Name $Name -BasePath $BasePath

    "This Folder is for 3rd party exe's, dlls etc" | Out-File $BasePath\$Name\src\$Name.resources\tools\Readme.md
}