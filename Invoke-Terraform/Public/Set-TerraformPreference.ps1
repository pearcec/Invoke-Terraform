<#
    .SYNOPSIS
        Set a user preference for Invoke-Terraform to modify default behavior.
    .DESCRIPTION
        Set a user preference for Invoke-Terraform to modify default behavior.
    .PARAMETER TFPreferences
        A Hastable of user preferences.
    .PARAMETER Clear
        Remove ALL user preferences.
    .EXAMPLE
        Set-TerraformPreference -TFPreferences @{'AutoDownload'=$true}

        Sets user preference to automatically download terraform binaries.
    .INPUTS
        None. You cannot pipe objects to Set-TerraformPreference.
    .OUTPUTS
        System.Collections.Hashtable

        Outputs a hashtable of user preferences.
    .LINK
        Get-TerraformPreference
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Set-TerraformPreference {
    [OutputType([Hashtable])]
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