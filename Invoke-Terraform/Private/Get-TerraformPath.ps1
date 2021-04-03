Function Get-TerraformPath {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    
    if ($isWindows) {
        return "$((Get-TerraformPreference).path)\terraform_$($TFVersion).exe"
    }
    return "$((Get-TerraformPreference).path)/terraform_$($TFVersion)"
}