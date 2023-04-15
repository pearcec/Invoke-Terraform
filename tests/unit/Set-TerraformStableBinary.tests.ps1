Describe 'Set-TerraformStableBinary' {
    BeforeAll {
        $outputDir = [IO.Path]::Combine($ENV:BHProjectPath, 'Output')
        $outputModDir = [IO.Path]::Combine($outputDir, $env:BHProjectName)
        $outputBinDir = [IO.Path]::Combine($outputModDir, 'bin')

        if (Test-Path $outputBinDir) {
            Remove-Item -Recurse $outputBinDir
        } 
        New-Item $outputBinDir -ItemType directory

        # Reinitialize the configuration
        $configuration = [IO.Path]::Combine($ENV:BHPSModulePath, 'Configuration.psd1')
        $defaultConfiguration = Import-Configuration -DefaultPath $configuration -CompanyName 'Invoke-Terraform' -Name 'Invoke-Terraform'

    }
    It 'has version passed 0.14.2' {
        Set-TerraformStableBinary -TFVersion 0.14.2 -Confirm:$false
        $testPathBin = Get-TerraformStableBinary
        $test = & $testPathBin -version | Select-String -Pattern ('Terraform v{0}' -f '0.14.2') -Quiet
        $test | Should -BeTrue
    }
    It 'has latest release' {
        $headers = @{
            Accept = 'application/vnd.github.v3+json'
        }
    
        $response = Invoke-RestMethod 'https://api.github.com/repos/hashicorp/terraform/releases/latest' -Method 'GET' -Headers $headers
        $latest = $response.name.substring(1)
        Set-TerraformStableBinary -Confirm:$false
        $testPathBin = Get-TerraformStableBinary
        $test = & $testPathBin -version | Select-String -Pattern ('Terraform v{0}' -f $latest) -Quiet
        $test | Should -BeTrue
    }
}