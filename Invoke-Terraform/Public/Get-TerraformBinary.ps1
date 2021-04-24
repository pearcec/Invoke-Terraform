<#
    .SYNOPSIS
        Get stable path for terraform binary (ie. terraform.exe or terraform)
    .DESCRIPTION
        Get stable path for terraform binary (ie. terraform.exe or terraform)
    .EXAMPLE
        Get-TerraformBinary

        Returns stable path for terraform binary
    .INPUTS
        None. You cannot pipe objects to Set-TerraformBinary.
    .OUTPUTS
        Returns a path.
    .LINK
        Set-TerraformBinary
    .LINK
        Online version: https://github.com/pearcec/Invoke-Terraform
#>
function Get-TerraformBinary {

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
    - Set-TerraformBinary
or:
    - Set-TerraformAutoSwitchBinary `$true
    - Switch-Terraform -TFVersion:[TFversion]
"@
    throw ''
}