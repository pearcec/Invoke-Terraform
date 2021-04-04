Function Get-TerraformPreference {
    param(
        [switch]$ClearCache = $False,
        [Switch]$Stored = $False
    )

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