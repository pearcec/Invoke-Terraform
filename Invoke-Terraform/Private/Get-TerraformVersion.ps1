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
    if ($Parent -eq $Home) {
        return $null
    }
    if ($Parent) {
        return Get-TerraformVersion $Parent
    }

    # Shouldn't get here
    return $null
}