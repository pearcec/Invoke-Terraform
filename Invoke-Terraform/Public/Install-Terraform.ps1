Function Install-Terraform {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion,
        [switch]$SkipChecksum = $False
    )

    if (Test-TerraformPath -TFVersion $TFVersion) {
        Write-Verbose "Terraform $($TFversion) already installed."
        return $true
    }
    Install-TerraformBinary -TFVersion $TFVersion -SkipChecksum:$SkipChecksum
}