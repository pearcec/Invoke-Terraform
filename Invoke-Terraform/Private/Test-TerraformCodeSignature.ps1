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
        # HashiCorp updated the signature in 1.3.8
        $tfThumbprint = (Get-AuthenticodeSignature -FilePath (Get-TerraformPath -TFVersion $TFVersion)).SignerCertificate.Thumbprint
        $configTFThumbprint = (Get-TerraformConfiguration).HashiCorpWindowsThumbprint

        Write-Host -ForegroundColor Yellow -Object "Terraform thumbprint: $tfThumbprint"
        Write-Host -ForegroundColor Yellow -Object "Terraform configTFThumbprint: $configTFThumbprint"


        if ($configTFThumbprint -is [String]) {
            # The configuration is a string
            return ($configTFThumbprint -eq $tfThumbprint)
        } elseif ($configTFThumbprint -is [Object[]]) {
            # The configuration is a list
            return ($configTFThumbprint -contains $tfThumbprint)
        } else {
            # The configuration is neither a string nor a list
            throw 'Invalid configuration for HashiCorpWindowsThumbprint, needs list or string'
        }
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