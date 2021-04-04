Function Copy-TerraformBinary {
    param(
        [parameter(Mandatory)]
        [string]$ZipPath
    )

    $installPath = (Get-TerraformPreference).Path

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
    $destPath = (Join-Path $installPath $binaryVersion)

    $tmpPath = [System.IO.Path]::GetTempPath()
    [string] $guid = [System.Guid]::NewGuid()

    $tmpfolder = (Join-Path $tmpPath $guid)

    Expand-Archive -Path $zipPath -DestinationPath $tmpFolder
    Copy-Item -Path $tmpfolder/$binary -Destination $destPath -Force

    # TODO: Is Powershelly way?
    if (-not $IsWindows) {
        & chmod +x $destPath
    }
}