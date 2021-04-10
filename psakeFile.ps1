Properties {
    $PSBPreference.Build.CompileModule = $true
    $PSBPreference.Test.CodeCoverage.Enabled = $true
    $PSBPreference.Test.ImportModule = $true
    $PSBPreference.Test.OutputFile = "$($PSBPreference.Build.OutDir)/testResults.xml"
}
Write-Host $PSBPreference
Task default -depends Test

Task Analyze -FromModule PowerShellBuild -Version '0.6.1' -preaction { Remove-Module Invoke-Terraform -ErrorAction SilentlyContinue }

