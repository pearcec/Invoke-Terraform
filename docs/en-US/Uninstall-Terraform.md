---
external help file: Invoke-Terraform-help.xml
Module Name: Invoke-Terraform
online version:
schema: 2.0.0
---

# Uninstall-Terraform

## SYNOPSIS
Uninstall a version of terraform.

## SYNTAX

```
Uninstall-Terraform [-TFVersion] <String> [<CommonParameters>]
```

## DESCRIPTION
Unnstall a version of terraform.

## EXAMPLES

### EXAMPLE 1
```
Uninstall-Terraform -TFVersion 0.14.7
```

Uninstalls terraform version 0.14.7

## PARAMETERS

### -TFVersion
The version of terraform to uninstall.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. You cannot pipe objects to Uninstall-Terraform.
## OUTPUTS

### None. Uninstall-Terraform returns nothing.
## NOTES

## RELATED LINKS

[Install-Terraform]()

[Online version: https://github.com/pearcec/Invoke-Terraform]()

