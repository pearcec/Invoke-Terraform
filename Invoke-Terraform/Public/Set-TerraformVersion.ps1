<#
    .SYNOPSIS
        Set configuration version for terraform.
    .DESCRIPTION
        Set configuration version for terraform.
    .PARAMETER TFVersion
        The preferred version.
    .EXAMPLE
        Set-TerraformVersion -TFVersion 0.14.7

        Sets configuration version for terraform to 0.14.7
    .INPUTS
        None. You cannot pipe objects to Set-TerraformVersion.
    .OUTPUTS
        None. Set-TerraformVersion returns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Set-TerraformVersion {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    begin {
        Write-Debug -Message 'Beginning'
        $configurationPath = Get-ConfigurationPath
        $autoSwitchBinary = (Get-TerraformConfiguration).autoSwitchBinary
    }

    process {
        if ($PSCmdlet.ShouldProcess($configurationPath, "Setting TFVesion configuration version to $($TFVersion)")) {
            Write-Verbose "Setting TFVersion configuration version to $($TFVersion)"
            Set-TerraformConfiguration @{ TFVersion = $TfVersion } -Confirm:$False
        }
        if ($autoSwitchBinary) {
            Set-TerraformBinary -TFVersion $TFVersion -Confirm:$ConfirmPreference
        }
    }

    end {
        Write-Debug -Message 'Ending'
    }
}

Set-Alias -Name Switch-Terraform -Value Set-TerraformVersion