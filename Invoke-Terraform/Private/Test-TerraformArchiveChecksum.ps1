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

    if ($SkipChecksum -or (Get-TerraformPreference).SkipChecksum) {
        Write-Verbose 'Skipping Terraform Archive Checksum test.'
        return $true
    }

    & gpg --keyserver (Get-TerraformPreference).PGPKeyServer --recv (Get-TerraformPreference).HashiCorpPGPKeyId
    if ($LASTEXITCODE -ne 0) {
        throw 'Unable to retrieve HashiCorp key'
    }
    & gpg --verify $SHASigPath $SHAPath
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to verify signature on $($SHAPath)"
    }

    $SHASum = (Get-FileHash $ZipPath).Hash
    $HashiCorpSHASum = (Get-Content $shaPath | Select-String $ArchiveName).ToString().Split()[0]
    if ($SHASum -ne $HashiCorpSHASum ) {
        throw "Unable to verify SHASUM with $($SHAPath)"
    }

    Write-Verbose "Terraform archive $($zipPath) passed checksum test"
    return $true
}