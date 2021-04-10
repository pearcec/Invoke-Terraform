---
external help file: Invoke-Terraform-help.xml
Module Name: Invoke-Terraform
online version:
schema: 2.0.0
---

# Invoke-Terraform

## SYNOPSIS
Run terraform version based on user preference.

## SYNTAX

```
Invoke-Terraform [[-TFVersion] <String>] [-SkipCodeSignature] [<CommonParameters>]
```

## DESCRIPTION
Run terraform version based on user preference.
Additional parameters are passed to the terraform binary.

## EXAMPLES

### EXAMPLE 1
```
Invoke-Terraform -TFVersion 0.14.7
```

Runs terraform version 0.14.7

### EXAMPLE 2
```
Invoke-Terraform
```

Runs terraform version based on user preference or default preference.

## PARAMETERS

### -TFVersion
Override preferred version of terraform to run.

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

### None. You cannot pipe objects to Invoke-Terraform.
## OUTPUTS

### None. Invoke-Terraform returns nothing.
## NOTES

## RELATED LINKS

[Install-Terraform]()

[Online version: https://github.com/pearcec/Invoke-Terraform]()

