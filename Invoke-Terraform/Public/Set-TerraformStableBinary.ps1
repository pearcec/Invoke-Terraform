<#
    .SYNOPSIS
        Set version for stable terraform binary (ie. terraform.exe or terraform)
    .DESCRIPTION
        Set version for stable terraform binary (ie. terraform.exe or terraform)
    .PARAMETER TFVersion
        The preferred version.
    .PARAMETER SkipChecksum
        Skip release archive checksum verification.
    .PARAMETER SkipCodeSignature
        Skip code signature verifcation.
    .EXAMPLE
        Set-TerraformStableBinary

        Sets the latest terraform version to the static name terraform.exe or terraform
    .EXAMPLE
        Set-TerraformStableBinary -TFVersion 0.14.7

        Sets terraform version 0.14.7 to the static name terraform.exe or terraform
    .INPUTS
        None. You cannot pipe objects to Set-TerraformStableBinary.
    .OUTPUTS
        None. Set-TerraformStableBinary returns nothing.
    .LINK
        Get-TerraformStableBinary
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Set-TerraformStableBinary {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [string]$TFVersion,
        [switch]$SkipChecksum = $False,
        [switch]$SkipCodeSignature = $False
    )

    begin {
        Write-Debug -Message 'Beginning'
        if (-not $TFVersion) {
            $TFVersion = Get-TerraformLatestRelease
        }
    }

    process {
        if ($PSCmdlet.ShouldProcess($configurationPath, "Setting static terraform binary to TFVesion $($TFVersion)")) {
            if (-not (Test-TerraformPath -TFVersion $TFVersion)) {
                Write-Verbose "Installing terraform version $($TFVersion)"
                Install-TerraformBinary -TFVersion $TFVersion -SkipChecksum:$SkipChecksum -SkipCodeSignature:$SkipCodeSignature
            }
            Copy-TerraformBinary -TFVersion $TFVersion
        }
    }

    end {
        Write-Debug -Message 'Ending'
    }
}