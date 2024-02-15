Function Get-Parameter {
    $commonParameters = [System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters
    $parentscopeMyInvocation = Get-Variable -Scope Global -Name myinvocation
    $parentscopeMyInvocation.Value.mycommand.Parameters.Keys |
    Where-Object { $commonParameters -notcontains $_ }
}
