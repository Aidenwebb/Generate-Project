<#
I want to create a new coding project and have source, test and Readme generated from my Project Name and description.
#>

#namespace Generate-Project.tests.integration.stories

Import-Module -Name .\src\generate-project\New-CodeProject.psm1

Describe 'New-Project provisioning script' {
    $parameters = @{
        'ProjectBasePath' = "$($TestDrive)\Test-ProjectBaseDirectory"
        'ProjectName' = 'TestProject'
        'ProjectDescription' = 'This is just a test project description'
    }

    $parameters.Add('ProjectPath', "$($parameters.ProjectBasePath)\$($parameters.ProjectName)")
    
    # Test Directory doesn't exist    
    Context "Project Directory Doesn't Exist prior to creation" {
        It "Doesn't exist" {
            Test-Path -Path $parameters.ProjectBasePath | Should -Be $false
        }
    }

    # Create the Directory structure
    Context "Project Directories Gets Created" {
        # Create the base project directory
        It 'Creates the base project directory'{
            New-CodeProject -BasePath $parameters.ProjectBasePath -Name $parameters.ProjectName -Description $parameters.ProjectDescription
            Test-Path -Path "$($parameters.ProjectPath).fake" | Should -Be $false
            Test-Path -Path "$($parameters.ProjectPath)" | Should -Be $true
        }
        It 'Creates the project source directories' {
            Test-Path -Path "$($parameters.ProjectPath)\src.fake" | Should -Be $false
            Test-Path -Path "$($parameters.ProjectPath)\src" | Should -Be $true
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName)" | Should -Be $true
        }
        It 'Creates the project testing directories' {
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).tests.fake" | Should -Be $false
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).tests.unit" | Should -Be $true
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).tests.integration" | Should -Be $true
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).tests.integration\stories" | Should -Be $true
        }
        It 'Creates the project resource directories' {
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).resourcesfake" | Should -Be $false
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).resources" | Should -Be $true
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).resources\tools" | Should -Be $true
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).resources\helpers" | Should -Be $true
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).resources\helpers\functions" | Should -Be $true
            Test-Path -Path "$($parameters.ProjectPath)\src\$($parameters.ProjectName).resources\templates" | Should -Be $true
        }
    }
    Context "Creates the Readme" {
        It "It Creates the Readme file" {
            Test-Path -Path "$($parameters.ProjectPath)\READEME.md" | Should -BeTrue
        }
    }
    # Test Readme Exists
    
    
}