<#
    .SYNOPSIS
        Helper function to sign the Hashi Corp PHP key.
    .DESCRIPTION
        Helper function to sign the Hashi Corp PHP key.
    .EXAMPLE
        Confirm-TerraformHashicorpKey

        Runs gpg to sign a HasiCorp PGP key.
    .INPUTS
        None. You cannot pipe objects to Confirm-TerraformHashicorpKey.
    .OUTPUTS
        None. Confirm-TerraformHashicorpKey returns nothing.
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
Function Confirm-TerraformHashicorpKey {
    & gpg --sign-key (Get-TerraformConfiguration).HashiCorpPGPKeyId
}