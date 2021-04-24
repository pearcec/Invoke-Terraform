---
external help file: Invoke-Terraform-help.xml
Module Name: Invoke-Terraform
online version:
schema: 2.0.0
---

# Set-TerraformBinary

## SYNOPSIS
Set version for stable terraform binary (ie.
terraform.exe or terraform)

## SYNTAX

```
Set-TerraformBinary [[-TFVersion] <String>] [-SkipChecksum] [-SkipCodeSignature] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Set version for stable terraform binary (ie.
terraform.exe or terraform)

## EXAMPLES

### EXAMPLE 1
```
Set-TerraformBinary
```

Sets the latest terraform version to the static name terraform.exe or terraform

### EXAMPLE 2
```
Set-TerraformBinary -TFVersion 0.14.7
```

Sets terraform version 0.14.7 to the static name terraform.exe or terraform

## PARAMETERS

### -TFVersion
The preferred version.

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

### None. You cannot pipe objects to Set-TerraformBinary.
## OUTPUTS

### None. Set-TerraformBinary returns nothing.
## NOTES

## RELATED LINKS

[Get-TerraformBinary]()

[Online version: https://github.com/pearcec/Invoke-Terraform]()

