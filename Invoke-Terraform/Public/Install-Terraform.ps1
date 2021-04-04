Function Install-Terraform {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion,
        [switch]$SkipChecksum = $False,
        [switch]$SkipCodeSignature = $False
    )

    if (Test-TerraformPath -TFVersion $TFVersion) {
        Write-Verbose "Terraform $($TFversion) already installed."
        return
    }
    Install-TerraformBinary -TFVersion $TFVersion -SkipChecksum:$SkipChecksum -SkipCodeSignature:$SkipCodeSignature
}