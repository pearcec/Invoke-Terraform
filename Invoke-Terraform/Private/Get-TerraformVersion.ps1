Function Get-TerraformVersion {
    param(
        [parameter(Mandatory)]
        [string]$Path
    )

    $terraformVersionFile = Join-Path -Path $Path -ChildPath .terraform-version
    if (Test-Path -Path $terraformVersionFile -PathType Leaf) {
        return $terraformVersionFile
    }

    $Parent = Split-Path $Path
    # Stop at users home directory
    if ($Parent -eq $Home) {
        return $null
    }
    if ($Parent) {
        Get-TerraformVersion $Parent
    } else {
        return $null
    }
}