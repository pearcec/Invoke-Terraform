<#
    .SYNOPSIS
        Get a preferences.
    .DESCRIPTION
        Get a preferences.  User preferences override default preferences.
    .PARAMETER ClearCache
        Clear preference cache.
    .PARAMETER Stored
        Output only user preferences.
    .EXAMPLE
        Get-TerraformPreference

        List all user preferences.
    .INPUTS
        None. You cannot pipe objects to Get-TerraformPreference.
    .OUTPUTS
        System.Collections.Hashtable

        Outputs a hashtable of user preferences.
    .LINK
        Set-TerraformPreference
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Get-TerraformPreference {
    param(
        [switch]$ClearCache = $False,
        [switch]$Stored = $False
    )

    if ($Stored) {
        if ((Test-Path -Path $HOME\.terraform\Invoke-Terraform.json -PathType leaf)) {
            return Get-Content -Path $HOME\.terraform\Invoke-Terraform.json | ConvertFrom-Json -AsHashtable
        }
        return @{}
    }

    if ($ClearCache) {
        Write-Verbose 'Clearing script preference cache'
        $script:preferenceCache = @{}
    }

    if ($script:preferenceCache.Count -eq 0) {
        Write-Verbose 'Loading preferences'
        if ((Test-Path -Path $HOME\.terraform\Invoke-Terraform.json -PathType leaf)) {
            $script:preferenceCache = Get-Content -Path $HOME\.terraform\Invoke-Terraform.json | ConvertFrom-Json -AsHashtable
        }
    }
    if ($Stored) {
        return $script:preferenceCache
    }
    $script:TFPreferences.keys | Where-Object {
        $_ -notin $script:preferenceCache.keys 
    } | ForEach-Object { 
        $script:preferenceCache.Add($_, $script:TFPreferences.Item($_) )
    }

    return $script:preferenceCache
}