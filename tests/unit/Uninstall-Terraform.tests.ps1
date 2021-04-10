Describe 'Uninstall-Terraform' {
    BeforeAll {
        $outputDir = [IO.Path]::Combine($ENV:BHProjectPath, 'Output')
        $outputModDir = [IO.Path]::Combine($outputDir, $env:BHProjectName)
        $outputBinDir = [IO.Path]::Combine($outputModDir, 'bin')

        if (Test-Path $outputBinDir) {
            Remove-Item -Recurse $outputBinDir
        } 
        New-Item $outputBinDir -ItemType directory
    }
    It 'has version passed 0.14.3 removed' {
        Install-Terraform -TFVersion 0.14.3
        $testPath = [IO.Path]::Combine($outputBinDir, 'terraform_0.14.3*')
        $test = Test-Path $testPath
        $test | Should -BeTrue
        Uninstall-Terraform -TFVersion 0.14.3
        $test = Test-Path $testPath
        $test | Should -BeFalse
    }
}