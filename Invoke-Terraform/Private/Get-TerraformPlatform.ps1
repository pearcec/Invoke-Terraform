function Get-TerraformPlatform {

    if ($IsWindows) {
        return 'windows'
    }
    
    if ($IsLinux) {
        return 'linux'
    }

    if ($IsMacOS) {
        return 'darwin'
    }
    throw 'Unknown platform.'
}