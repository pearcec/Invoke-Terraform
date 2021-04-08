function Set-TerraformConfiguration {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory)]
        [hashtable]$Configuration
    )
    begin {
        Write-Debug -Message 'Beginning'
        $configurationPath = Get-ConfigurationPath
    }
    process {
        # Merge existing configuration with updates
        $existingConfiguration = Import-Configuration
        $existingConfiguration.keys | Where-Object {
            $_ -notin $Configuration.keys
        } | ForEach-Object {
            $Configuration.Add($_, $existingConfiguration.Item($_) )
        }

        # Drop keys not defined by default configuration
        $Configuration.keys | Where-Object {
            $_ -notin $existingConfiguration.keys
        } | ForEach-Object {
            $Configuration.Remove($_)
        }

        if ($PSCmdlet.ShouldProcess($configurationPath, "Setting Configuration configuration to $($Configuration | ConvertTo-Json -Depth 5)")) {
            Write-Verbose "Setting configuration to $($Configuration | ConvertTo-Json -Depth 5)"
            $Configuration | Export-Configuration
        }
    }

    end {
        Write-Debug -Message 'Ending'
    }
}