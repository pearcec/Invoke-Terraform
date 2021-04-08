function Set-TerraformConfiguration {
    param(
        [parameter(Mandatory)]
        [hashtable]$Configuration
    )
    # Merge existing configuration with updates
    $existingConfiguration = Import-Configuration
    $existingConfiguration.keys | Where-Object {
        $_ -notin $Configuration.keys
    } | ForEach-Object { 
        $Configuration.Add($_, $existingConfiguration.Item($_) )
    }

    # Drop keys not defined by configuration
    $Configuration.keys | Where-Object {
        $_ -notin $existingConfiguration.keys
    } | ForEach-Object {
        $Configuration.Remove($_)
    }

    Write-Verbose "Setting configuration to $($Configuration | ConvertTo-Json -Depth 5)"
    $Configuration | Export-Configuration
}