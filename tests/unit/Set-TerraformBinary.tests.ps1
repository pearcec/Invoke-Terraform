Describe 'Set-TerraformBinary' {
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
        Set-TerraformBinary -TFVersion 0.14.2 -Confirm:$false
        $testPathBin = Get-TerraformBinary
        $test = & $testPathBin -version | Select-String ('Terraform v{0}' -f '0.14.2')
        $test | Should -BeTrue
    }
    It 'has latest release' {
        $headers = @{
            Accept = 'application/vnd.github.v3+json'
        }
    
        $response = Invoke-RestMethod 'https://api.github.com/repos/hashicorp/terraform/releases/latest' -Method 'GET' -Headers $headers
        $latest = $response.name.substring(1)
        Set-TerraformBinary -Confirm:$false
        $testPathBin = Get-TerraformBinary
        $test = & $testPathBin -version | Select-String ('Terraform v{0}' -f $latest)
        $test | Should -BeTrue
    }
}