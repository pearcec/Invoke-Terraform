$PSDefaultParameterValues = @{
    'Invoke-WebRequest:Verbose' = $false
    'Invoke-WebRequest:Debug'   = $false
}

$ProgressPreference = 'SilentlyContinue'

# Dot source public/private functions
$public = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1')  -Recurse -ErrorAction Stop)
$private = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Private/*.ps1') -Recurse -ErrorAction Stop)
foreach ($import in @($public + $private)) {
    try {
        . $import.FullName
    } catch {
        Write-Error "Unable to dot source [$($import.FullName)]"
        throw $_
    }
}

Export-ModuleMember -Function $public.Basename -Alias *