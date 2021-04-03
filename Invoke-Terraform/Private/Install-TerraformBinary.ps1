Function Install-TerraformBinary {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion,
        [switch]$SkipChecksum = $False
    )

    $zipPath = Get-TerraformBinary -TFVersion $TFVersion -SkipChecksum:$SkipChecksum
 
    try {
        Copy-TerraformBinary -ZipPath $zipPath
    } catch {
        Write-Error "Unable to copy binary from $zipPath."
        throw $_
    }

    if (-not (Test-TerraformPath -TFVersion $TFVersion)) {
        throw "Failed to install Terraform $($TFversion)."
    }

    if ( -not (Test-TerraformCodeSignature -TFVersion $TFVersion)) {
        Uninstall-Terraform -TFVersion $TFVersion
        throw "Terraform $($TFversion) fail to pass Code Signature test. Uninstalling."
    }
}