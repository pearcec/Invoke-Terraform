<#
    .SYNOPSIS
        Set auto switch binary configuration.
    .DESCRIPTION
        Set auto switch binary configuration.
    .PARAMETER AutoStableBinary
        Either true or false.
    .EXAMPLE
        Set-TerraformAutoStableBinary $true

        Sets auto switch binary configuration to true
    .INPUTS
        None. You cannot pipe objects to Set-TerraformAutoStableBinary.
    .OUTPUTS
        None. Set-TerraformAutoStableBinary returns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Set-TerraformAutoStableBinary {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory)]
        [boolean]$AutoStableBinary
    )
    begin {
        Write-Debug -Message 'Beginning'
        $configurationPath = Get-ConfigurationPath
    }

    process {
        if ($PSCmdlet.ShouldProcess($configurationPath, "Setting AutoStableBinary configuration to $($AutoStableBinary)")) {
            Write-Verbose "Setting AutoStableBinary configuration to $($AutoStableBinary)"
            Set-TerraformConfiguration @{ AutoStableBinary = $AutoStableBinary } -Confirm:$False
        }
    }
    end {
        Write-Debug -Message 'Ending'
    }
}