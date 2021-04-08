<#
    .SYNOPSIS
        Set auto download configuration.
    .DESCRIPTION
        Set auto download configuration.
    .PARAMETER AutoDownload
        Either true or false.
    .EXAMPLE
        Set-TerraformAutoDownload $true

        Sets auto download configuration to true
    .INPUTS
        None. You cannot pipe objects to Set-TerraformAutoDownload.
    .OUTPUTS
        None. Set-TerraformAutoDownload returns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Set-TerraformAutoDownload {
    param(
        [parameter(Mandatory)]
        [boolean]$AutoDownload
    )
    Write-Verbose "Setting AutoDownload configuration to $($AutoDownload)"
    Set-TerraformConfiguration @{ AutoDownload = $AutoDownload }
}