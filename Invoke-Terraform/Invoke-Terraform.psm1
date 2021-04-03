# Use [version] and [string]prerelease? or Use [string]

$tfPreferences = [PSCustomObject]@{
    Path                       = Join-Path $HOME "bin" # c:\terraform? AppData?
    TFVersion                  = '0.14.7'
    ReleaseUrl                 = 'https://releases.hashicorp.com/terraform'
    AutoDownload               = $false
    ConfirmCodeSignature       = $true
    # TODO: Fetch the latest $tfAutoLatest = $true - Updates AppData tfVersion

    # TODO: Do I need this?
    HashiCorpPGPThumbprint     = '91A6E7F85D05C65630BEF18951852D87348FFC4C'
    HashiCorpPGPKeyId          = '0x51852D87348FFC4C'
    # TODO: Do I need this if codesign is successful?
    HashiCorpTeamIdentifier    = 'D38WU7D763'
    # TODO: Do I need this if Status.Valid() ?
    HashiCorpWindowsThumbprint = '35AB9FC834D217E9E7B1778FB1B97AF7C73792F2'
    PGPKeyServer               = 'keyserver.ubuntu.com'
    
    # TODO: Nag if people for not getting their own signatures?
    SquelchChecksumWarning     = $false
    
    SkipChecksum               = $false
}

$preferenceCache = @{}

$PSDefaultParameterValues = @{
    'Invoke-WebRequest:Verbose' = $false
    'Invoke-WebRequest:Debug'   = $false
}

# Dot source public/private functions
$public = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1')  -Recurse -ErrorAction Stop)
$private = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Private/*.ps1') -Recurse -ErrorAction Stop)
foreach ($import in @($public + $private)) {
    try {
        . $import.FullName
    } catch {
        Write-Error "Unable to dot source [$($import.FullName)]"
        throw $_
    }
}

Export-ModuleMember -Function $public.Basename -Alias *