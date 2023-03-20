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
    It 'has latest release' {
        $headers = @{
            Accept = 'application/vnd.github.v3+json'
        }
    
        $response = Invoke-RestMethod 'https://api.github.com/repos/hashicorp/terraform/releases/latest' -Method 'GET' -Headers $headers
        $latest = $response.name.substring(1)
        Install-Terraform
        $testPath = [IO.Path]::Combine($outputBinDir, "terraform_$($latest)*")
        $test = Test-Path $testPath
        $test | Should -BeTrue
    }
    It 'has version passed 1.3.8' {
        Install-Terraform -TFVersion 1.3.8
        $testPath = [IO.Path]::Combine($outputBinDir, 'terraform_1.3.8*')
        $test = Test-Path $testPath
        $test | Should -BeTrue
    }
}
