<#
    .SYNOPSIS
        Uninstall a version of terraform.
    .DESCRIPTION
        Unnstall a version of terraform.
    .PARAMETER TFVersion
        The version of terraform to uninstall.
    .EXAMPLE
        Uninstall-Terraform -TFVersion 0.14.7

        Uninstalls terraform version 0.14.7
    .INPUTS
        None. You cannot pipe objects to Uninstall-Terraform.
    .OUTPUTS
        None. Uninstall-Terraform returns nothing.
    .LINK
        Install-Terraform
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Uninstall-Terraform {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )

    if (Test-TerraformPath -TFVersion $TFVersion) {
        Write-Verbose "Uninstalling terraform version $($TFVersion)"
        Remove-Item (Get-TerraformPath -TFVersion $TFVersion) -Force
    } else {
        Write-Warning "Unable to uninstall terraform. Version ($TFVersion) not found."
    }
}