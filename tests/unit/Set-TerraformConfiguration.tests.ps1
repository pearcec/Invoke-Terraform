# Only test configuration not covered by other tests
Describe 'Set-TerraformVersion' {
    It 'has Terraform version configuration set to 0.14.6' {
        Set-TerraformConfiguration -Configuration @{'TFVersion' = '0.14.6' } -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.TFVersion | Should -Be '0.14.6'
    }
    It 'has not-existent set to null' {
        Set-TerraformConfiguration -Configuration @{'Fake' = 'fake' } -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.Fake | Should -Be $null
    }
    It 'has string set for thumbprint' {
        Set-TerraformConfiguration -Configuration @{'HashiCorpWindowsThumbprint' = '35AB9FC834D217E9E7B1778FB1B97AF7C73792F2' } -Confirm:$false
        Install-Terraform -TFVersion 0.14.3
        $testPath = [IO.Path]::Combine($outputBinDir, "terraform_0.14.3*")
        $test = Test-Path $testPath
        $test | Should -BeTrue
    }
}