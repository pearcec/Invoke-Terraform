<#
    .SYNOPSIS
        Set configuration version for terraform.
    .DESCRIPTION
        Set configuration version for terraform.
    .PARAMETER TFVersion
        The preferred version.
    .EXAMPLE
        Set-TerraformVersion -TFVersion 0.14.7

        Sets configuration version for terraform to 0.14.7
    .INPUTS
        None. You cannot pipe objects to Set-TerraformVersion.
    .OUTPUTS
        None. Set-TerraformVersion returns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Set-TerraformVersion {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    Write-Verbose "Setting TFVersion configuration to version $($TFVersion)"
    Set-TerraformConfiguration @{ TFVersion = $TfVersion }
}

Set-Alias -Name Switch-Terraform -Value Set-TerraformVersion