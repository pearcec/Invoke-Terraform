@{
    TFPath                     = Join-Path -Path $PSScriptRoot -ChildPath '..' -AdditionalChildPath 'bin'
    TFVersion                  = '0.15.1'
    ReleaseUrl                 = 'https://releases.hashicorp.com/terraform'
    AutoDownload               = $false
    AutoStableBinary           = $false

    HashiCorpPGPKeyId          = '0x34365D9472D7468F'
    HashiCorpTeamIdentifier    = 'D38WU7D763'
    HashiCorpWindowsThumbprint = '35AB9FC834D217E9E7B1778FB1B97AF7C73792F2'
    PGPKeyServer               = 'keyserver.ubuntu.com'

    SquelchChecksumWarning     = $false
    SkipChecksum               = $false
    SkipCodeSignature          = $false
}
