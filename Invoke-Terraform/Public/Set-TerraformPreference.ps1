Function Set-TerraformPreference {
    param(
        [hashtable]$TFPreferences,
        [switch]$Clear
    )
    # Get existing values
    if (-not (Test-Path $HOME\.terraform\ -PathType Container)) {
        if (-not (New-Item -Path $HOME -Name '.terraform' -ItemType 'directory')) {
            throw "Failed to create $($HOME)\.terraform preference directory"
        }
    }
    if ($Clear -and (Test-Path $HOME\.terraform\Invoke-Terraform.json)) {
        Remove-Item $HOME\.terraform\Invoke-Terraform.json -Force
    }

    $existingTFPreferences = Get-TerraformPreference -Stored
    # Load existing preferences
    if ($existingTFPreferences.Count -gt 0) {
        $existingTFPreferences.keys | Where-Object {
            $_ -notin $TFPreferences.keys
        } | ForEach-Object { 
            $TFPreferences.Add($_, $existingTFPreferences.Item($_) )
        }
    }
    $TFPreferences | ConvertTo-Json -Depth 1 | Set-Content -Path $HOME\.terraform\Invoke-Terraform.json
    Get-TerraformPreference -ClearCache
}