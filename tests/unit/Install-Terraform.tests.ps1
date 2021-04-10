Describe 'Install-Terraform' {
    BeforeAll {
        $outputDir = [IO.Path]::Combine($ENV:BHProjectPath, 'Output')
        $outputModDir = [IO.Path]::Combine($outputDir, $env:BHProjectName)
        $outputBinDir = [IO.Path]::Combine($outputModDir, 'bin')

        if (Test-Path $outputBinDir) {
            Remove-Item -Recurse $outputBinDir
        } 
        New-Item $outputBinDir -ItemType directory
    }
    It 'has version passed 0.14.2' {
        Install-Terraform -TFVersion 0.14.2
        $testPath = [IO.Path]::Combine($outputBinDir, 'terraform_0.14.2*')
        $test = Test-Path $testPath
        $test | Should -BeTrue
    }
}