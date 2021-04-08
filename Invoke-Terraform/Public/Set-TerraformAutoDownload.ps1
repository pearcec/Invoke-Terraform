<#
    .SYNOPSIS
        Set auto download configuration.
    .DESCRIPTION
        Set auto download configuration.
    .PARAMETER AutoDownload
        Either true or false.
    .EXAMPLE
        Set-TerraformAutoDownload $true

        Sets auto download configuration to true
    .INPUTS
        None. You cannot pipe objects to Set-TerraformAutoDownload.
    .OUTPUTS
        None. Set-TerraformAutoDownload returns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Set-TerraformAutoDownload {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory)]
        [boolean]$AutoDownload
    )
    begin {
        Write-Debug -Message 'Beginning'
        $configurationPath = Get-ConfigurationPath
    }

    process {
        if ($PSCmdlet.ShouldProcess($configurationPath, "Setting AutoDownload configuration to $($AutoDownload)")) {
            Write-Verbose "Setting AutoDownload configuration to $($AutoDownload)"
            Set-TerraformConfiguration @{ AutoDownload = $AutoDownload } -Confirm:$False
        }
    }
    end {
        Write-Debug -Message 'Ending'
    }
}