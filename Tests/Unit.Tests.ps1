
BeforeAll {
    # Dynamically find the module path
    $moduleParentPath = Split-Path -Path $PSScriptroot
    $moduleName = Import-Clixml -Path (Join-Path -Path $moduleParentPath -ChildPath modulename.psclixml)
    $modulePath = Join-Path -Path $moduleParentPath -ChildPath $moduleName
    Import-Module $modulePath -Force
}

Describe 'Get-Parameters' {
    It 'Should return an array of strings' {
        Function Get-FunctionTestGetParameter {
            [CmdletBinding()]
            param(
                $Param1,
                $Param2
            )
            $popVar = Get-Variable -Name myinvocation -Scope Global
            Set-Variable -Name myinvocation -Value $myinvocation -Scope Global
            Get-Parameter
            Set-Variable -Name myinvocation -Value $popVar.Value -Scope Global
        }
        Get-FunctionTestGetParameter | Should -Be "Param1","Param2"
    }
}