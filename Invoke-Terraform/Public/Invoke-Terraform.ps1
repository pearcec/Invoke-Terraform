

Function Invoke-Terraform {
    <#
    .SYNOPSIS
        Run terraform version based on user preference.
    .DESCRIPTION
        Run terraform version based on user preference.
        Additional parameters are passed to the terraform binary.
    .PARAMETER TFVersion
        Override preferred version of terraform to run.
    .PARAMETER SkipCodeSignature
        Skip code signature verifcation.
    .EXAMPLE
        Invoke-Terraform -TFVersion 0.14.7

        Runs terraform version 0.14.7
    .EXAMPLE
        Invoke-Terraform

        Runs terraform version based on user preference or default preference.
    .INPUTS
        None. You cannot pipe objects to Invoke-Terraform.
    .OUTPUTS
        None. Invoke-Terraform returns nothing.
    .LINK
        Install-Terraform
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
    #>
    param(
        [string]$TFVersion,
        [switch]$SkipCodeSignature = $False
    )
    
    if ((Test-Path .terraform-version) -and (-not $TFVersion)) {
        $TFVersion = Get-Content .terraform-version
        # TODO regex validate the version
        Write-Verbose "Found .terraform-version $TFVersion"
    }

    # If Version still isn't set
    if (-not $TFVersion) {
        $TFVersion = (Get-TerraformPreference).TFVersion
    }

    if (-not (Test-TerraformPath -TFVersion $TFVersion)) {
        Write-Warning "Terraform version $($TFVersion) not found."

        if ((Get-TerraformPreference).AutoDownload) {
            Write-Verbose "Auto downloading terraform version $($TFVersion)"
            Install-Terraform -TFVersion $TFVersion
        } else {
            Write-Error @"
Terraform version $($TFVersion) not installed. Run either

    - Install-Terraform -TFVersion $($TFVersion)
    - Set-TerraformPreference -TFPreferences @{'AutoDownload'=`$true}
"@
            throw ''
        }
    }

    if (-not (Test-TerraformCodeSignature -TFVersion $TFVersion -SkipCodeSignature:$SkipCodeSignature)) {
        throw 'Unable to confirm Code Signature of terraform binary'
    }

    & (Get-TerraformPath -TFVersion $TFVersion) $args
}

Set-Alias -Name terraform -Value Invoke-Terraform
