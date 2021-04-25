<#
    .SYNOPSIS
        Get stable path for terraform binary (ie. terraform.exe or terraform)
    .DESCRIPTION
        Get stable path for terraform binary (ie. terraform.exe or terraform)
    .EXAMPLE
        Get-TerraformStableBinary

        Returns stable path for terraform binary
    .INPUTS
        None. You cannot pipe objects to Set-TerraformStableBinary.
    .OUTPUTS
        Returns a path.
    .LINK
        Set-TerraformStableBinary
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Get-TerraformStableBinary {

    $installPath = (Get-TerraformConfiguration).TFPath
    $binary = 'terraform'
    if ($isWindows) {
        $binary += '.exe'
    }
    $binPath = Join-Path -Path $installPath -ChildPath $binary

    if (Test-Path $binPath -PathType leaf ) {
        return $binPath
    }
    Write-Error @"
Terraform static binary not set. Run either:
    - Set-TerraformStableBinary
or:
    - Set-TerraformAutoStableBinary `$true
    - Set-TerraformVersion -TFVersion:[TFversion]
or:
    - Set-TerraformAutoStableBinary `$true
    - Install-Terraform
"@
    throw ''
}