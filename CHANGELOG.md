# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.5.0]

### Changed

- `Invoke-Terraform` recursively searches up for `.terraform-version` stopping at root ([#12](https://github.com/pearcec/Invoke-Terraform/issues/12))

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