Function Set-TerraformPreference {
    param(
        [string]$TFVersion,
        [string]$Path,
        [boolean]$ConfirmCodeSignature,
        [boolean]$AutoDownload,
        [switch]$Clear
    )
    # Get existing values
    if (-not (Test-Path $HOME\.terraform\ -PathType Container)) {
        if (-not (New-Item -Path $HOME -Name '.terraform' -ItemType 'directory')) {
            Write-Error "Failed to create $($HOME)\.terraform preference directory"
            throw $_
        }
    }
    if ($Clear -and (Test-Path $HOME\.terraform\Invoke-Terraform.json)) {
        Remove-Item $HOME\.terraform\Invoke-Terraform.json -Force
    }
    # Sort through loading and saving only what was preferred. (There a module to support this?)
    $tfPreferences.TFVersion = $TFVersion
    $tfPreferences | ConvertTo-Json -Depth 1 | Set-Content -Path $HOME\.terraform\Invoke-Terraform.json
    Get-TerraformPreference -ClearCache
}