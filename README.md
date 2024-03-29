# Invoke-Terraform

A PowerShell module to run terraform.

| GitHub Actions                                                         | PSGallery                                           | License                              |
| ---------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------ |
| [![GitHub Actions Status][github-actions-badge]][github-actions-build] | [![PowerShell Gallery][psgallery-badge]][psgallery] | [![License][license-badge]][license] |

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
| Command                             | Description                                                                                |
| ----------------------------------- | ------------------------------------------------------------------------------------------ |
| Confirm-TerraformHashicorpKey       | Confirm the HashiCorp Security Key in gpg.                                                 |
| Get-TerraformConfiguration          | Get Invoke-Terraform configurations.                                                       |
| Get-TerraformStableBinary           | Get the path for the current static installation of terraform binary.                      |
| Install-Terraform                   | Install a version of terraform.                                                            |
| Invoke-Terraform                    | Run terraform.                                                                             |
| Set-TerraformAutoDownload           | Set Invoke-Terraform to automatically download terraform if needed.                        |
| Set-TerraformAutoStableBinary       | Set Set-TerraformVersion to automatically switch static  installation of terraform binary. |
| Set-TerraformConfiguration          | Set Invoke-Terraform configurations.                                                       |
| Set-TerraformStableBinary           | Set version of static installation of terraform binary.                                    |
| Set-TerraformSquelchChecksumWarning | Squelch checksum warnings.                                                                 |
| Set-TerraformVersion                | Change default version of terraform to invoke.                                             |
| Switch-Terraform                    | Set-TerraformVersion alias.                                                                |
| Uninstall-Terraform                 | Uninstall a version of terraform.                                                          |
| terraform                           | Invoke-Terraform alias.                                                                    |

## User Preferences

| Name             | Description                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Path             | Installation location for terraform binaries.                                                               |
| TFVersion        | Preferred version of terraform.                                                                                                    |
| ReleaseUrl       | Defaults to https://releases.hashicorp.com/terraform                                                                               |
| AutoDownload     | Automatically download terraform when invoking if the binary is not installed. Defaults to false.                                  |
| AutoStableBinary | Automatically switch the static binary to the TFVersion called with Set-TerraformVersion (ie Switch-Terraform). Defaults to false. |

## Verification

HashiCorp provides a few methods of [verification](https://www.hashicorp.com/security) for code authenticity.  *Invoke-Terraform* uses checksum verification with gpg on all platforms and code signing verification with MacOS (starting ?) and Windows (starting with version 0.12.24).

The default behavior is to always run code signature verification every time terraform is run when supported and checksums when binaries are installed.  By default HashiCorp PGP Key is import from keyserver.ubuntu.com.  The following additional preferences may be used to validate the signatures provide by this module, and adjust the settings according to your 
security tolerance:

| Name                       | Description                                                                                 |
| -------------------------- | ------------------------------------------------------------------------------------------- |
| HashiCorpPGPKeyId          | 0x34365D9472D7468F                                                                          |
| HashiCorpTeamIdentifier    | D38WU7D763                                                                                  |
| HashiCorpWindowsThumbprint | 35AB9FC834D217E9E7B1778FB1B97AF7C73792F2, '7868E4F55FD7B047CD8BF93FEA8C38509CFB5939'         |
| PGPKeyServer               | keyserver.ubuntu.com                                                                        |
| SquelchChecksumWarning     | Turn off warning from gpg when HashiCorp imported key has not be signed. Defaults to false. |
| SkipChecksum               | Turn off release archive checksum verification via gpg. Defaults to false.                  |
| SkipCodeSignature          | Turn off code signature verification. Defaults to false.                                    |

## Other behavior

By default *Invoke-Terraform* searches the current working directory for the file `.terraform-version`.  This file contains the preferred version of terraform. Store this file with your terraform project to seamlessly invoke the required version of terraform.

## Best Practice

### $ENV:Path, $PATH

It is recommended the `terraform` binary be removed from `$ENV:Path`.  Even though the powershell alias overrides what is available in the `Path`, unexpected usage could occur if this module was not loaded. This eliminates the chance of running an unplanned version.

### VSCode

If terraform is removed from your path as recommended, the [vscode-terraform](https://github.com/hashicorp/vscode-terraform) extension breaks. The `Set-TerraformStableBinary` has been added to provide a stable path name.  Run `Get-TerraformStableBinary` to retrieve the path. Use the following example for vscode settings: 

```json
"terraform.languageServer": {
    "external": true,
    "pathToBinary": "",
    "args": [
        "serve",
        "-tf-exec=C:/users/pearcec/Documents/PowerShell/Modules/Invoke-Terraform/bin/terraform.exe",
    ],
    "maxNumberOfProblems": 100,
    "trace.server": "off"
}
```

[github-actions-badge]: https://github.com/pearcec/Invoke-Terraform/workflows/CI/badge.svg
[github-actions-build]: https://github.com/pearcec/Invoke-Terraform/actions
[psgallery-badge]:      https://img.shields.io/powershellgallery/dt/invoke-terraform.svg
[psgallery]:            https://www.powershellgallery.com/packages/invoke-terraform
[license-badge]: https://img.shields.io/github/license/pearcec/invoke-terraform.svg
[license]:       https://raw.githubusercontent.com/pearcec/Invoke-Terraform/main/LICENSE
