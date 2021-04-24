<#
    .SYNOPSIS
        Set auto switch binary configuration.
    .DESCRIPTION
        Set auto switch binary configuration.
    .PARAMETER AutoSwitchBinary
        Either true or false.
    .EXAMPLE
        Set-TerraformAutoSwitchBinary $true

        Sets auto switch binary configuration to true
    .INPUTS
        None. You cannot pipe objects to Set-TerraformAutoSwitchBinary.
    .OUTPUTS
        None. Set-TerraformAutoSwitchBinary returns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Set-TerraformAutoSwitchBinary {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory)]
        [boolean]$AutoSwitchBinary
    )
    begin {
        Write-Debug -Message 'Beginning'
        $configurationPath = Get-ConfigurationPath
    }

    process {
        if ($PSCmdlet.ShouldProcess($configurationPath, "Setting AutoSwitchBinary configuration to $($AutoSwitchBinary)")) {
            Write-Verbose "Setting AutoSwitchBinary configuration to $($AutoSwitchBinary)"
            Set-TerraformConfiguration @{ AutoSwitchBinary = $AutoSwitchBinary } -Confirm:$False
        }
    }
    end {
        Write-Debug -Message 'Ending'
    }
}