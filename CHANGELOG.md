# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.3.0]

## Changed
- BREAKING: Refactor to use Configuration Module. Existing configurations are ignored.

## [0.2.0]

## Changed
- Moved TFPreferences to HashMap, only set preferences passed to Set-TerraformPreference
- Require PowerShellVersion 6.0 for ConvertFrom-Json -AsHashtable
- Platform independent Get-TerraformPath
- Add SkipCodeSignature and SkipChecksum preferences and parameters globally, with better error handling on gpg

## [0.1.0]

### Added

- Initial release