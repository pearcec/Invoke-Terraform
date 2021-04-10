@{
    PSDependOptions  = @{
        Target = 'CurrentUser'
    }
    Configuration    = '1.3.1'
    Pester           = @{
        Parameters = @{
            MinimumVersion     = '5.1.1'
            SkipPublisherCheck = $true
        }
    }
    platyPS          = '0.14.1'
    PowerShellBuild  = @{
        RequiredVersion = '0.6.1'
    }
    psake            = '4.9.0'
    PSScriptAnalyzer = '1.19.1'
}