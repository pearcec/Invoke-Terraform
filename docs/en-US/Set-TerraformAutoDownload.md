---
external help file: Invoke-Terraform-help.xml
Module Name: Invoke-Terraform
online version:
schema: 2.0.0
---

# Set-TerraformAutoDownload

## SYNOPSIS
Set auto download configuration.

## SYNTAX

```
Set-TerraformAutoDownload [-AutoDownload] <Boolean> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Set auto download configuration.

## EXAMPLES

### EXAMPLE 1
```
Set-TerraformAutoDownload $true
```

Sets auto download configuration to true

## PARAMETERS

### -AutoDownload
Either true or false.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: False
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

### None. You cannot pipe objects to Set-TerraformAutoDownload.
## OUTPUTS

### None. Set-TerraformAutoDownload returns nothing.
## NOTES

## RELATED LINKS

[Get-TerraformConfiguration]()

[Online version: https://github.com/pearcec/Invoke-Terraform]()

