<#
    .SYNOPSIS
        Set squelch checksum warning configuration.
    .DESCRIPTION
        Set squelch checksum warning configuration.
    .PARAMETER AutoDownload
        Either true or false.
    .EXAMPLE
        Set-TerraformSquelchChecksumWarning $true

        Set squelch checksum warning configuration to true
    .INPUTS
        None. You cannot pipe objects to Set-TerraformSquelchChecksumWarning.
    .OUTPUTS
        None. Set-TerraformSquelchChecksumWarningreturns nothing.
    .LINK
        Get-TerraformConfiguration
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Set-TerraformSquelchChecksumWarning {
    param(
        [parameter(Mandatory)]
        [boolean]$SquelchChecksumWarning
    )
    Write-Verbose "Setting SquelchChecksumWarning configuration to $($SquelchChecksumWarning)"
    Set-TerraformConfiguration @{ SquelchChecksumWarning = $SquelchChecksumWarning }
}