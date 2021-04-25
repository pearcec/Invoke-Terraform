Function Get-TerraformZip {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion,
        [switch]$SkipChecksum = $False
    )

    $platform = Get-TerraformPlatform
    $archiveName = 'terraform_{0}_{1}_amd64.zip' -f $TFVersion, $platform
    $zipUrl = '{0}/{1}/terraform_{1}_{2}_amd64.zip' -f (Get-TerraformConfiguration).ReleaseUrl, $TFVersion, $platform
    $shaUrl = '{0}/{1}/terraform_{1}_SHA256SUMS' -f (Get-TerraformConfiguration).ReleaseUrl, $TFVersion
    $shaSigUrl = '{0}/{1}/terraform_{1}_SHA256SUMS.sig' -f (Get-TerraformConfiguration).ReleaseUrl, $TFVersion

    $tmpPath = [System.IO.Path]::GetTempPath()
    [string] $guid = [System.Guid]::NewGuid()

    $zipPath = (Join-Path $tmpPath "$($guid).zip")
    $shaPath = (Join-Path $tmpPath "$($guid)_SHA256SUMS")
    $shaSigPath = (Join-Path $tmpPath "$($guid)_SHA256SUMS.sig")

    try {
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
    } catch {
        Write-Error "Unable to request $($zipUrl)"
        throw $_
    }

    try {
        Invoke-WebRequest -Uri $shaUrl -OutFile $shaPath
    } catch {
        throw "Unable to request $($shaUrl)"
    }

    try {
        Invoke-WebRequest -Uri $shaSigUrl -OutFile $shaSigPath
    } catch {
        throw "Unable to request $($shaSigUrl)"
    }

    if ( -not (Test-TerraformArchiveChecksum -SkipChecksum:$SkipChecksum -ArchiveName $archiveName -ZipPath $zipPath -SHAPath $shaPath -SHASigPath $shaSigPath) ) {
        throw 'Terraform Archive failed Checksum test.'
    }
    return $zipPath
}