

Function Invoke-Terraform {
    <#
    .SYNOPSIS
        Run terraform version based on preference.
    #>
    param(
        [string]$TFVersion
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
        Write-Warning  "Terraform version ($TFVersion) not found."

        if ((Get-TerraformPreference).AutoDownload) {
            try {
                Install-Terraform -TFVersion $TFVersion
            } catch {
                Write-Error "Failed to auto download terraform version ($TFVersion)"
                throw $_
            }
        }
    }

    if (-not (Test-TerraformCodeSignature -TFVersion $TFVersion)) {
        Write-Error 'Unable to confirm Code Signature of terraform binary'
        throw $_
    }

    & (Get-TerraformPath -TFVersion $TFVersion) $args

}
Set-Alias -Name terraform -Value Invoke-Terraform
