# Execute the file with the fucntions we want to test.

Import-Module .\src\generate-project\New-CodeProject.psm1
Import-Module .\src\generate-project\New-CodeProjectDirectoryTree.psm1

# Variables
$parameters = @{
    ProjectName = "Test-Project"
    ProjectDescription = "This is a test project"
}

# Tests
Describe 'Unit Tests' -Tag Unit {


    Context "Project Directory Doesn't Exist prior to creation" {
        It "Doesn't exist" {
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)" | Should -Be $false
        }
    }
    Context "Project Directories Gets Created" {
        # Create the base project directory
        It 'Creates the base project directory'{
            New-CodeProjectDirectoryTree -BasePath $($TestDrive) -Name $parameters.ProjectName -Description $parameters.ProjectDescription
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName).fake" | Should -Be $false
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)" | Should -Be $true
        }
        It 'Creates the project source directories' {
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src.fake" | Should -Be $false
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src" | Should -Be $true
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName)" | Should -Be $true
        }
        It 'Creates the project testing directories' {
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).tests.fake" | Should -Be $false
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).tests.unit" | Should -Be $true
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).tests.integration" | Should -Be $true
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).tests.integration\stories" | Should -Be $true
        }
        It 'Creates the project resource directories' {
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).resourcesfake" | Should -Be $false
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).resources" | Should -Be $true
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).resources\tools" | Should -Be $true
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).resources\helpers" | Should -Be $true
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).resources\helpers\functions" | Should -Be $true
            Test-Path -Path "$($TestDrive)\$($parameters.ProjectName)\src\$($parameters.ProjectName).resources\templates" | Should -Be $true
        }
    }
}
