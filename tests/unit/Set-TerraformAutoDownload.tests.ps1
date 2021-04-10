Describe 'Set-TerraformAutoDownload' {
    It 'has AutoDownload configuration set to true' {
        Set-TerraformAutoDownload -AutoDownload $true -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.AutoDownload | Should -Be $true 
    }

    It 'has AutoDownload configuration set to false' {
        Set-TerraformAutoDownload -AutoDownload $false -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.AutoDownload | Should -Be $false 
    }
}