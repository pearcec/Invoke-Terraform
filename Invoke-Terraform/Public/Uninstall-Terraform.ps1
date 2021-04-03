Function Uninstall-Terraform {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )

    if (Test-TerraformPath -TFVersion $TFVersion) {
        Remove-Item (Get-TerraformPath -TFVersion $TFVersion) -Force
    } else {
        Write-Warning "Unable to uninstall terraform. Version ($TFVersion) not found."
    }
}