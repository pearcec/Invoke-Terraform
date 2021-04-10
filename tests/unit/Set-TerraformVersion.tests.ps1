Describe 'Set-TerraformVersion' {
    It 'has Terraform version configuration set to 0.14.8' {
        Set-TerraformVersion -TFVersion 0.14.8 -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.TFVersion | Should -Be '0.14.8'
    }
}