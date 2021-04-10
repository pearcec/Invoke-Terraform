Describe 'Set-TerraformSquelchChecksumWarning' {
    It 'has Squelch Checksum Warning configuration set to true' {
        Set-TerraformSquelchChecksumWarning -SquelchChecksumWarning  $true -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.SquelchChecksumWarning  | Should -Be $true 
    }

    It 'has Squelch Checksum Warning configuration set to false' {
        Set-TerraformSquelchChecksumWarning -SquelchChecksumWarning  $false -Confirm:$false
        $setting = Get-TerraformConfiguration
        $setting.SquelchChecksumWarning  | Should -Be $false 
    }
}