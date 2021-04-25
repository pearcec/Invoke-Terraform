Function Copy-TerraformBinary {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion,
        [string]$ZipPath
    )

    $installPath = (Get-TerraformConfiguration).TFPath
    if (-not (Test-Path $installPath -PathType Container)) {
        if (-not (New-Item -Path $installPath -ItemType 'directory')) {
            throw "Failed to create $($installPath) preference directory"
        }
    }

    $binary = 'terraform'
    if ($isWindows) {
        $binary += '.exe'
    }

    $binaryVersion = 'terraform_{0}' -f $TFVersion
    if ($IsWindows) {
        $binaryVersion += '.exe'
    }

    if ($ZipPath) {
        $tmpPath = [System.IO.Path]::GetTempPath()
        [string] $guid = [System.Guid]::NewGuid()

        $tmpfolder = (Join-Path $tmpPath $guid)

        Expand-Archive -Path $zipPath -DestinationPath $tmpFolder

        $sourcePath = (Join-Path $tmpFolder $binary)
        $destPath = (Join-Path $installPath $binaryVersion)
    } else {
        $sourcePath = (Join-Path $installPath $binaryVersion)
        $destPath = (Join-Path $installPath $binary)
    }
    Copy-Item -Path $sourcePath -Destination $destPath -Force

    # TODO: Is Powershelly way?
    if (-not $IsWindows) {
        & chmod +x $destPath
    }
}