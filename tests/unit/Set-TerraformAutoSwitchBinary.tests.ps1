Describe 'Set-TerraformAutoSwitchBinary' {
    It 'has AutoSwitchBinary configuration set to true' {
        Set-TerraformAutoSwitchBinary -AutoSwitchBinary $true -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.AutoSwitchBinary | Should -Be $true 
    }

    It 'has AutoSwitchBinary configuration set to false' {
        Set-TerraformAutoSwitchBinary -AutoSwitchBinary $false -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.AutoSwitchBinary | Should -Be $false 
    }
}