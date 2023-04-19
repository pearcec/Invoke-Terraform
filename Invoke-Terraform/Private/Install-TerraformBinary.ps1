Function Install-TerraformBinary {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion,
        [switch]$SkipChecksum = $False,
        [switch]$SkipCodeSignature = $False
    )

    $zipPath = Get-TerraformZip -TFVersion $TFVersion -SkipChecksum:$SkipChecksum

    try {
        Copy-TerraformBinary -TFVersion $TFVersion -ZipPath $zipPath
    } catch {
        Write-Error "Unable to copy binary from $zipPath."
        throw $_
    }

    if (-not (Test-TerraformPath -TFVersion $TFVersion)) {
        throw "Failed to install Terraform $($TFversion) binary."
    }

    if ( -not (Test-TerraformCodeSignature -TFVersion $TFVersion -SkipCodeSignature:$SkipCodeSignature)) {
        Uninstall-Terraform -TFVersion $TFVersion
        throw "Terraform $($TFversion) failed to pass Code Signature test. Uninstalling."
    }
}