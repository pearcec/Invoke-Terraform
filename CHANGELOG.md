# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.6.1]

###

- Capture stderr output from gpg. Some automation platforms highlight stderr read.
- Quiet codesign unless running verbose.

## [0.6.0]

### Fixed

- Support for 1.0.0, making it the new default
- Removed invalid description of Path from README.  `$HOME\bin` is no longer the default.

## [0.5.1]

### Security

- Updated GPG keys: due to [HCSEC-2021-12](https://discuss.hashicorp.com/t/hcsec-2021-12-codecov-security-event-and-hashicorp-gpg-key-exposure/23512) Codecov Security Event and HashiCorp GPG Key Exposure. See Terraform Updates for [HCSEC-2021-12](https://discuss.hashicorp.com/t/terraform-updates-for-hcsec-2021-12/23570) for guidance.

If the following error is received

```pwsh
Install-Terraform -TFVersion 0.15.1

gpg: Signature made 04/26/21 17:02:20 Eastern Daylight Time
gpg:                using RSA key B36CBA91A2C0730C435FC280B0B441097685B676
gpg: Can't check signature: No public key
Exception: C:\Users\pearcec\Documents\PowerShell\Modules\Invoke-Terraform\0.5.1\Invoke-Terraform.psm1:173:9
Line |
 173 |          throw "Unable to verify signature on $($SHAPath)"
     |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     | Unable to verify signature on
     | C:\Users\pearcec\AppData\Local\Temp\8ce5da55-215d-465f-861f-9778ee719d5d_SHA256SUMS
```

Then update the Invoke-Terraform configuration:

```pwsh
Set-TerraformConfiguration -Configuration @{ HashiCorpPGPKeyId='0x34365D9472D7468F';}
```

### Changed

- Slight documentation tweak
- Removed unused HashiCorpPGPThumbprint
- Source SHA256SUM signatures based on PGP Key ID

## [0.5.0]

### Changed

- `Invoke-Terraform` recursively searches up for `.terraform-version` stopping at root ([#12](https://github.com/pearcec/Invoke-Terraform/issues/12))
- Provide a binary without a version reference in the filename ([#13](https://github.com/pearcec/Invoke-Terraform/issues/13))

## [0.4.0]

### Added

- `Install-Terraform` defaults to latest when `-TFVersion` is not passed (https://github.com/pearcec/Invoke-Terraform/issues/10)
- Add stock contributing guidelines
- Add stock pull request template

## [0.3.0]

### Changed
- BREAKING: Refactor to use Configuration Module. Existing configurations are ignored.
- Fix PSAnalyzer complaints

### Added
- Add ShouldProcess on Set cmdlets
- Add GH Actions testing and publishing
- Adopt PowerShellBuild.
- Add pester testd
- Add .gitignore.
- Add standard build.ps1, psakeFile.ps1 and requirements.psd1.


## [0.2.0]

## Changed
- Moved TFPreferences to HashMap, only set preferences passed to Set-TerraformPreference
- Require PowerShellVersion 6.0 for ConvertFrom-Json -AsHashtable
- Platform independent Get-TerraformPath
- Add SkipCodeSignature and SkipChecksum preferences and parameters globally, with better error handling on gpg

## [0.1.0]

### Added

- Initial release