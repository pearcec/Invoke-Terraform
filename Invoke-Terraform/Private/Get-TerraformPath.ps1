Function Get-TerraformPath {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    
    if ($isWindows) {
        $fileExt = '.exe'
    }
    return Join-Path (Get-TerraformConfiguration).TFPath "terraform_$($TFVersion)$($fileExt)"
}