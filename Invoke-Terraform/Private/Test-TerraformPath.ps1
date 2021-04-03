Function Test-TerraformPath {
    param(
        [parameter(Mandatory)]
        [string]$TFVersion
    )
    Write-Verbose "Testing path for Terraform version $($TFVersion) "
    return Test-Path (Get-TerraformPath -TFVersion $TFVersion) -PathType leaf
}