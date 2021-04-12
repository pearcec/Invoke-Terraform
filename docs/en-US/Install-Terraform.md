---
external help file: Invoke-Terraform-help.xml
Module Name: Invoke-Terraform
online version:
schema: 2.0.0
---

# Install-Terraform

## SYNOPSIS
Install a version of terraform.

## SYNTAX

```
Install-Terraform [[-TFVersion] <String>] [-SkipChecksum] [-SkipCodeSignature] [<CommonParameters>]
```

## DESCRIPTION
Install a version of terraform.

## EXAMPLES

### EXAMPLE 1
```
Install-Terraform -TFVersion 0.14.7
```

Installs terraform version 0.14.7

## PARAMETERS

### -TFVersion
The version of terraform to install.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipChecksum
Skip release archive checksum verification.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCodeSignature
Skip code signature verifcation.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. You cannot pipe objects to Install-Terraform.
## OUTPUTS

### None. Install-Terraform returns nothing.
## NOTES

## RELATED LINKS

[Uninstall-Terraform]()

[Online version: https://github.com/pearcec/Invoke-Terraform]()

