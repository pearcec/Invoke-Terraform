Describe 'Set-TerraformAutoStableBinary' {
    It 'has AutoStableBinary configuration set to true' {
        Set-TerraformAutoStableBinary -AutoStableBinary $true -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.AutoStableBinary | Should -Be $true 
    }

    It 'has AutoStableBinary configuration set to false' {
        Set-TerraformAutoStableBinary -AutoStableBinary $false -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.AutoStableBinary | Should -Be $false 
    }
}