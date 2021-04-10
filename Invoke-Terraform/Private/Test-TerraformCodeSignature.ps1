Function Test-TerraformCodeSignature {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion,
        [switch]$SkipCodeSignature
    )
    if ($SkipCodeSignature -or (Get-TerraformConfiguration).SkipCodeSignature) {
        Write-Verbose 'Skipping Code Signature test'
        return $true
    }
    if ($IsWindows) {
        # HashiCorp started signing with version 0.12.24
        # TODO return true and throw a Warning
        $tfThumbprint = (Get-AuthenticodeSignature -FilePath (Get-TerraformPath -TFVersion $TFVersion)).SignerCertificate.Thumbprint
        return $tfthumbprint -eq (Get-TerraformConfiguration).HashiCorpWindowsThumbprint
    }
    if ($IsMacOs) {
        $tfThumbprint = (codesign --verify -d --verbose=2 (Get-TerraformPath -TFVersion $TFVersion) 2>&1 | Select-String TeamIdentifier).ToString().Split('=')[1]
        return $tfthumbprint -eq (Get-TerraformConfiguration).HashiCorpTeamIdentifier
    }
    if ($IsLinux) {
        Write-Verbose 'CodeSignature check at runtime is not supported on Linux.'
        return $true
    }
    Write-Error 'Unable to test terraform CodeSignature. Unknown platform.'
    throw $_
}