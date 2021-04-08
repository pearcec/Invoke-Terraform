@{
    TFPath                     = Join-Path $PSScriptRoot '..' 'bin'
    TFVersion                  = '0.14.7'
    ReleaseUrl                 = 'https://releases.hashicorp.com/terraform'
    AutoDownload               = $false

    HashiCorpPGPThumbprint     = '91A6E7F85D05C65630BEF18951852D87348FFC4C'
    HashiCorpPGPKeyId          = '0x51852D87348FFC4C'
    HashiCorpTeamIdentifier    = 'D38WU7D763'
    HashiCorpWindowsThumbprint = '35AB9FC834D217E9E7B1778FB1B97AF7C73792F2'
    PGPKeyServer               = 'keyserver.ubuntu.com'
    
    SquelchChecksumWarning     = $false
    SkipChecksum               = $false
    SkipCodeSignature          = $false
}
