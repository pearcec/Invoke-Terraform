Describe 'Invoke-Terraform' {
    BeforeAll {
        $outputDir = [IO.Path]::Combine($ENV:BHProjectPath, 'Output')
        $outputModDir = [IO.Path]::Combine($outputDir, $env:BHProjectName)
        $outputBinDir = [IO.Path]::Combine($outputModDir, 'bin')

        if (Test-Path $outputBinDir) {
            Remove-Item -Recurse $outputBinDir
        } 
        New-Item $outputBinDir -ItemType directory
    }
    It 'has version defined by configuration 0.14.5' {
        Set-TerraformVersion -TFVersion 0.14.5 -Confirm:$false
        Set-TerraformAutoDownload -AutoDownload:$true -Confirm:$false
        Invoke-Terraform -version | Out-File TestDrive:\version.txt
        (Get-Content TestDrive:\version.txt)[0] | Should -Match 0.14.5
    }
    It 'has version passed 0.14.6' {
        Set-TerraformVersion -TFVersion 0.14.5 -Confirm:$false
        Set-TerraformAutoDownload -AutoDownload:$true -Confirm:$false
        Invoke-Terraform 0.14.6 -version | Out-File TestDrive:\version-0.14.6.txt
        (Get-Content TestDrive:\version-0.14.6.txt)[0] | Should -Match 0.14.6
    }
    It 'has version 0.14.1 from .terraform-version' {
        Set-TerraformVersion -TFVersion 0.14.5 -Confirm:$false
        Set-TerraformAutoDownload -AutoDownload:$true -Confirm:$false
        $terraformVersionFile = [IO.Path]::Combine('..', '.terraform-version') 
        '0.14.1' | Out-File -Path $terraformVersionFile
        Invoke-Terraform -version | Out-File TestDrive:\version-0.14.1.txt
        (Get-Content TestDrive:\version-0.14.1.txt)[0] | Should -Match 0.14.1
        Remove-Item -Force -Path $terraformVersionFile
    }
}