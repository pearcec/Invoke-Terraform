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
}