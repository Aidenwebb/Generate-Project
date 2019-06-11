function New-CodeProjectDirectoryTree {
    <#
    .SYNOPSIS
    Creates the Folder Structure for a new code project
    .DESCRIPTION

    .NOTES

    .INPUTS

    .OUTPUTS

    .PARAMETER Name
    The Project Name

    .PARAMETER BasePath
    The Path in which the project will be created

    .PARAMETER Description
    A description of the project

    .EXAMPLE
    New-CodeProjectDirectories -Name Test-Project -BasePath C:\Projects -Description "A test project"
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]

    param(
        [parameter(Mandatory=$true, Position=0)][string]$Name,
        [parameter(Mandatory=$true, Position=1)][string]$BasePath,
        [parameter(Mandatory=$false, Position=2)][string]$Description,
        [switch]$Force
    )

   $Paths = @(
        # Project Directory
        "$BasePath\$Name",
        # Project Source Directory
        "$BasePath\$Name\src",
        # Core Files Source Directory
        "$BasePath\$Name\src\$Name",
        # Tests Directories
        "$BasePath\$Name\src\$Name.tests.unit",
        "$BasePath\$Name\src\$Name.tests.integration",
        "$BasePath\$Name\src\$Name.tests.integration\stories",
        # Resources Directories
        "$BasePath\$Name\src\$Name.resources",
        "$BasePath\$Name\src\$Name.resources\helpers",
        "$BasePath\$Name\src\$Name.resources\helpers\functions",
        "$BasePath\$Name\src\$Name.resources\tools",
        "$BasePath\$Name\src\$Name.resources\templates"
    )

    foreach ($Path in $Paths) {
        New-Item -Path $Path -ItemType Directory
    }
}