function Test-TerraformArchiveChecksum {
    param (
        [parameter(Mandatory)]
        [string]$ArchiveName,
        [parameter(Mandatory)]
        [string]$ZipPath,
        [parameter(Mandatory)]
        [string]$SHAPath,
        [parameter(Mandatory)]
        [string]$SHASigPath,
        [switch]$SkipChecksum = $False

    )

    if ($SkipChecksum -or (Get-TerraformConfiguration).SkipChecksum) {
        Write-Verbose 'Skipping Terraform Archive Checksum test.'
        return $true
    }

    $output = gpg --list-keys (Get-TerraformConfiguration).HashiCorpPGPKeyId 2>&1
    if ($LASTEXITCODE -ne 0) {
        gpg --quiet --keyserver (Get-TerraformConfiguration).PGPKeyServer --recv (Get-TerraformConfiguration).HashiCorpPGPKeyId
        if ($LASTEXITCODE -ne 0) {
            throw 'Unable to retrieve HashiCorp key'
        }
    } else {
        # Refresh incase of future revoke user will recevie warning
        gpg --quiet --keyserver (Get-TerraformConfiguration).PGPKeyServer --recv (Get-TerraformConfiguration).HashiCorpPGPKeyId
    }

    $output = gpg --verify $SHASigPath $SHAPath 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to verify signature on $($SHAPath) : $($output)"
    }
    if (-not ((Get-TerraformConfiguration).SquelchChecksumWarning) -and ($output | Select-String 'WARNING: This key is not certified' -Quiet)) {
        Write-Warning @'
The HashiCorp key has been installed but not certified. Run either of the following

    - Confirm-TerraformHashiCorpKey
    - Set-TerraformSquelchChecksumWarning $true
'@
    }

    $SHASum = (Get-FileHash $ZipPath).Hash
    $HashiCorpSHASum = (Get-Content $shaPath | Select-String $ArchiveName).ToString().Split()[0]
    if ($SHASum -ne $HashiCorpSHASum ) {
        throw "Unable to verify SHASUM with $($SHAPath)"
    }

    Write-Verbose "Terraform archive $($zipPath) passed checksum test"
    return $true
}