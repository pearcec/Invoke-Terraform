<#
    .SYNOPSIS
        Set squelch checksum warning configuration.
    .DESCRIPTION
        Set squelch checksum warning configuration.
    .PARAMETER SquelchChecksumWarning
        Either true or false.
    .EXAMPLE
        Set-TerraformSquelchChecksumWarning $true

        Set squelch checksum warning configuration to true
    .INPUTS
        None. You cannot pipe objects to Set-TerraformSquelchChecksumWarning.
    .OUTPUTS
        None. Set-TerraformSquelchChecksumWarningreturns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Set-TerraformSquelchChecksumWarning {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory)]
        [boolean]$SquelchChecksumWarning
    )
    begin {
        Write-Debug -Message 'Beginning'
        $configurationPath = Get-ConfigurationPath
    }

    process {
        if ($PSCmdlet.ShouldProcess($configurationPath, "Setting SquelchChecksumWarning configuration to $($SquelchChecksumWarning)")) {
            Write-Verbose "Setting SquelchChecksumWarning configuration to $($SquelchChecksumWarning)"
            Set-TerraformConfiguration @{ SquelchChecksumWarning = $SquelchChecksumWarning } -Confirm:$False
        }
    }

    end {
        Write-Debug -Message 'Ending'
    }
}