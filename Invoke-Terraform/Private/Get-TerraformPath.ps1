Function Get-TerraformPath {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    
    if ($isWindows) {
        $fileExt = '.exe'
    }
    return Join-Path (Get-TerraformPreference).Path "terraform_$($TFVersion)$($fileExt)"
}