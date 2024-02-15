[CmdletBinding()]
param(
    $test1,
    $test2
)

$moduleParentPath = Split-Path -Path $PSScriptroot
$moduleName = Import-Clixml -Path (Join-Path -Path $moduleParentPath -ChildPath modulename.psclixml)
$modulePath = Join-Path -Path $moduleParentPath -ChildPath $moduleName
Import-Module $modulePath -Force

Get-Parameter

# Function Get-FunctionTestGetParameter {
#     [CmdletBinding()]
#     param(
#         $Param1,
#         $Param2
#     )
#     Get-Parameter
# }
# Get-FunctionTestGetParameter -Param1 dfg