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
        Write-Error "Failed to install Terraform $($TFversion)."
        throw $_
    }

    if ( -not (Test-TerraformCodeSignature -TFVersion $TFVersion)) {
        Write-Error "Terraform $($TFversion) fail to pass Code Signature test. Uninstalling."
        Uninstall-Terraform -TFVersion $TFVersion
        throw $_
    }
}