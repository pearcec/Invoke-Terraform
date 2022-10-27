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
        if ($PSCmdlet.MyInvocation.BoundParameters['Verbose'].IsPresent) {
            codesign --verify -d --verbose=2 (Get-TerraformPath -TFVersion $TFVersion)
        } else {
            codesign --verify (Get-TerraformPath -TFVersion $TFVersion)
        }
        return $LASTEXITCODE -eq 0
    }
    if ($IsLinux) {
        Write-Verbose 'CodeSignature check at runtime is not supported on Linux.'
        return $true
    }
    Write-Error 'Unable to test terraform CodeSignature. Unknown platform.'
    throw $_
}