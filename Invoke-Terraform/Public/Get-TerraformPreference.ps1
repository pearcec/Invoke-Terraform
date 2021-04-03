Function Get-TerraformPreference {
    param(
        [switch]$ClearCache = $False
    )

    if ($ClearCache) {
        Write-Verbose 'Clearing script preference cache'
        $script:preferenceCache = @{}
    }
    
    if ($script:preferenceCache.Count -eq 0) {
        Write-Verbose 'Loading preferences'
        $script:preferenceCache = Get-Content -Path $HOME\.terraform\Invoke-Terraform.json | ConvertFrom-Json
    }
    # TODO: Fill in defaults

    return $script:preferenceCache
}