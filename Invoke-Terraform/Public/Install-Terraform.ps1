<#
    .SYNOPSIS
        Install a version of terraform.
    .DESCRIPTION
        Install a version of terraform.
    .PARAMETER TFVersion
        The version of terraform to install.
    .PARAMETER SkipChecksum
        Skip release archive checksum verification.
    .PARAMETER SkipCodeSignature
        Skip code signature verifcation.
    .EXAMPLE
        Install-Terraform -TFVersion 0.14.7

        Installs terraform version 0.14.7
    .INPUTS
        None. You cannot pipe objects to Install-Terraform.
    .OUTPUTS
        None. Install-Terraform returns nothing.
    .LINK
        Uninstall-Terraform
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Install-Terraform {
    param(
        [string]$TFVersion,
        [switch]$SkipChecksum = $False,
        [switch]$SkipCodeSignature = $False
    )

    if (-not $TFVersion) {
        $TFVersion = Get-TerraformLatestRelease
    }

    if (Test-TerraformPath -TFVersion $TFVersion) {
        Write-Verbose "Terraform $($TFversion) already installed."
        return
    }
    Write-Verbose "Installing terraform version $($TFVersion)"
    Install-TerraformBinary -TFVersion $TFVersion -SkipChecksum:$SkipChecksum -SkipCodeSignature:$SkipCodeSignature
}