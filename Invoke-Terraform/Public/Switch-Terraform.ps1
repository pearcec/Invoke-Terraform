Function Switch-Terraform {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    Set-TerraformPreference -TFVersion $TFVersion
}