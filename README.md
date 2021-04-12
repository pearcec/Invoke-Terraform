# Invoke-Terraform

A PowerShell module to run terraform.

| GitHub Actions | PSGallery | License |
|----------------|-----------|---------|
[![GitHub Actions Status][github-actions-badge]][github-actions-build] | [![PowerShell Gallery][psgallery-badge]][psgallery] | [![License][license-badge]][license]

## Overview

*Invoke-Terraform* is a PowerShell module that downloads, validates binary authenticity and runs multiple versions of terraform.  It is cross-platform with user preferences.

## Installation

To install the module from the [PowerShell Gallery](https://www.powershellgallery.com/):

```powershell
Install-Module -Name Invoke-Terraform -Repository PSGallery
```

## Usage

```powershell
Install-Terraform -TFVersion 0.14.9

Invoke-Terraform

Invoke-Terraform -TFVersion 0.14.8

terraform -TFVersion 0.14.8 -version
```

## Commands 
| Command | Description |
|---------|-------------|
Confirm-TerraformHashicorpKey | Confirm the HashiCorp Security Key in gpg.
Get-TerraformPreference | List user preferences.
Install-Terraform | Install a version of terraform.
Invoke-Terraform | Run terraform.
Set-TerraformPreference | Set Invoke-Terraform user preferences.
Switch-Terraform | Change default version of terraform to invoke.
Uninstall-Terraform | Uninstall a version of terraform.
terraform | Invoke-Terraform alias.

## User Preferences

| Name | Description |
|------|-------------|
Path | Installation location for terraform binaries. Defaults to $HOME\bin.
TFVersion | Preferred version of terraform.
ReleaseUrl | Defaults to https://releases.hashicorp.com/terraform
AutoDownload | Automatically download terraform when invoking if the binary is not installed. Defaults to false.

## Verification

HashiCorp provides a few methods of [verification](https://www.hashicorp.com/security) for code authenticity.  *Invoke-Terraform* uses checksum verification with gpg on all platforms and code signing verification with MacOS (starting ?) and Windows (starting with version 0.12.24).

The default behavior is to always run code signature verification every time terraform is run when supported and checksums when binaries are installed.  By default HashiCorp PGP Key is import from keyserver.ubuntu.com.  The following additional preferences may be used to validate the signatures provide by this module, and adjust the settings according to your 
security tolerance:

| Name | Description |
|------|-------------|
HashiCorpPGPThumbprint     | 91A6E7F85D05C65630BEF18951852D87348FFC4C
HashiCorpPGPKeyId          | 0x51852D87348FFC4C
HashiCorpTeamIdentifier    | D38WU7D763
HashiCorpWindowsThumbprint | 35AB9FC834D217E9E7B1778FB1B97AF7C73792F2
PGPKeyServer               | keyserver.ubuntu.com
SquelchChecksumWarning     | Turn off warning from gpg when HashiCorp imported key has not be signed. Defaults to false.
SkipChecksum               | Turn off release archive checksum verification via gpg. Defaults to false.
SkipCodeSignature          | Turn off code signature verification. Defaults to false.

## Other behavior

By default *Invoke-Terraform* searches the current working directory for the file `.terraform-version`.  This file contains the preferred version of terraform. Store this file with your terraform project to seamlessly invoke the required version of terraform.

[github-actions-badge]: https://github.com/pearcec/Invoke-Terraform/workflows/CI/badge.svg
[github-actions-build]: https://github.com/pearcec/Invoke-Terraform/actions
[psgallery-badge]:      https://img.shields.io/powershellgallery/dt/invoke-terraform.svg
[psgallery]:            https://www.powershellgallery.com/packages/invoke-terraform
[license-badge]: https://img.shields.io/github/license/pearcec/invoke-terraform.svg
[license]:       https://raw.githubusercontent.com/pearcec/Invoke-Terraform/main/LICENSE
