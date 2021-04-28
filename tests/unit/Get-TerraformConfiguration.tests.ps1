
Describe 'Get-TerraformConfiguration' {
    BeforeAll {
        $configuration = [IO.Path]::Combine($ENV:BHPSModulePath, 'Configuration.psd1')
        $defaultConfiguration = Import-Configuration -DefaultPath $configuration -CompanyName 'Invoke-Terraform' -Name 'Invoke-Terraform'
        $setting = Get-TerraformConfiguration
    }
    It 'has default TFPath' {
        $script:setting.TPath | Should -Be $script:defaultConfiguration.TFPath
    }
    It 'has default TFVersion' {
        $script:setting.TFVersion | Should -Be $script:defaultConfiguration.TFVersion
    }
    It 'has default ReleaseUrl' {
        $script:setting.ReleaseUrl | Should -Be $script:defaultConfiguration.ReleaseUrl
    }
    It 'has default AutoDownload' {
        $script:setting.AutoDownload | Should -Be $script:defaultConfiguration.AutoDownload
    }
    It 'has default AutoStableBinary' {
        $script:setting.AutoStableBinary | Should -Be $script:defaultConfiguration.AutoStableBinary
    }
    It 'has default HashiCorpPGPKeyId' {
        $script:setting.HashiCorpPGPKeyId | Should -Be $script:defaultConfiguration.HashiCorpPGPKeyId
    }
    It 'has default HashiCorpTeamIdentifier' {
        $script:setting.HashiCorpTeamIdentifier | Should -Be $script:defaultConfiguration.HashiCorpTeamIdentifier
    }
    It 'has default HashiCorpWindowsThumbprint' {
        $script:setting.HashiCorpWindowsThumbprint | Should -Be $script:defaultConfiguration.HashiCorpWindowsThumbprint
    }
    It 'has default PGPKeyServer' {
        $script:setting.PGPKeyServer | Should -Be $script:defaultConfiguration.PGPKeyServer
    }
    It 'has default SquelchChecksumWarning' {
        $script:setting.SquelchChecksumWarning | Should -Be $script:defaultConfiguration.SquelchChecksumWarning
    }
    It 'has default SkipChecksum' {
        $script:setting.SkipChecksum | Should -Be $script:defaultConfiguration.SkipChecksum
    }
    It 'has default SkipCodeSignature' {
        $script:setting.SkipCodeSignature | Should -Be $script:defaultConfiguration.SkipCodeSignature
    }
}

