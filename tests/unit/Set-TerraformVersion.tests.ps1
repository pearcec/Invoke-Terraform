Describe 'Set-TerraformVersion' {
    BeforeAll {
        $outputDir = [IO.Path]::Combine($ENV:BHProjectPath, 'Output')
        $outputModDir = [IO.Path]::Combine($outputDir, $env:BHProjectName)
        $outputBinDir = [IO.Path]::Combine($outputModDir, 'bin')

        if (Test-Path $outputBinDir) {
            Remove-Item -Recurse $outputBinDir
        } 
        New-Item $outputBinDir -ItemType directory
    }
    It 'has Terraform version configuration set to 0.14.8' {
        Set-TerraformVersion -TFVersion 0.14.8 -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.TFVersion | Should -Be '0.14.8'
    }
    It 'has version passed 0.14.3' {
        Set-TerraformAutoSwitchBinary -AutoSwitchBinary:$true -Confirm:$false
        Set-TerraformVersion -TFVersion 0.14.3 -Confirm:$false
        $testPathBin = Get-TerraformBinary
        $test = & $testPathBin -version | Select-String ('Terraform v{0}' -f '0.14.3')
        $test | Should -BeTrue
    }
}