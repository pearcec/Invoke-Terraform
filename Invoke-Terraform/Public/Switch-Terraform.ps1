<#
    .SYNOPSIS
        Set a user preference for default version of terraform.
    .DESCRIPTION
        Set a user preference for default version of terraform.
    .PARAMETER TFVersion
        The preferred version.
    .EXAMPLE
        Switch-Terraform -TFVersion 0.14.7

        Sets user preference for default version of terraform to 0.14.7
    .INPUTS
        None. You cannot pipe objects to Switch-Terraform.
    .OUTPUTS
        None. Switch-Terraform returns nothing.
    .LINK
        Get-TerraformPreference
    .LINK
        Set-TerraformPreference
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Switch-Terraform {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    Write-Verbose "Setting TFVersion user preference to version $($TFVersion)"
    Set-TerraformPreference -TFPreferences @{'TFVersion' = $TFVersion } | Out-Null
}