Properties {
    $PSBPreference.Build.CompileModule = $true
    $PSBPreference.Test.ImportModule = $true
    # Broken?
    # $PSBPreference.Test.CodeCoverage.Enabled = $true
    $PSBPreference.Test.ScriptAnalysisEnabled = $true
    $PSBPreference.Test.OutputFile = "$($PSBPreference.Build.OutDir)/testResults.xml"
}

Task default -depends Test

Task Test -FromModule PowerShellBuild -Version '0.6.1'
