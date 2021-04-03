

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
                throw "Failed to auto download terraform version ($TFVersion)"
            }
        } else {
            # TODO Let user know AutoDownload is an option or run Install-Terraform -TFVersion $TFVersion
            throw "Terraform version ($TFVersion) not installed."

        }
    }

    if (-not (Test-TerraformCodeSignature -TFVersion $TFVersion)) {
        throw 'Unable to confirm Code Signature of terraform binary'
    }

    & (Get-TerraformPath -TFVersion $TFVersion) $args
}

Set-Alias -Name terraform -Value Invoke-Terraform
