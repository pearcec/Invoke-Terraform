---
external help file: Invoke-Terraform-help.xml
Module Name: Invoke-Terraform
online version:
schema: 2.0.0
---

# Set-TerraformVersion

## SYNOPSIS
Set configuration version for terraform.

## SYNTAX

```
Set-TerraformVersion [-TFVersion] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Set configuration version for terraform.

## EXAMPLES

### EXAMPLE 1
```
Set-TerraformVersion -TFVersion 0.14.7
```

Sets configuration version for terraform to 0.14.7

## PARAMETERS

### -TFVersion
The preferred version.

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. You cannot pipe objects to Set-TerraformVersion.
## OUTPUTS

### None. Set-TerraformVersion returns nothing.
## NOTES

## RELATED LINKS

[Get-TerraformConfiguration]()

[Online version: https://github.com/pearcec/Invoke-Terraform]()

