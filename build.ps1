[cmdletbinding(DefaultParameterSetName = 'Task')]
param(
    # Build task(s) to execute
    [parameter(ParameterSetName = 'task', Position = 0)]
    [string[]]$Task = 'default',

    # Bootstrap dependencies
    [switch]$Bootstrap,

    # List available build tasks
    [parameter(ParameterSetName = 'Help')]
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Bootstrap dependencies
if ($Bootstrap.IsPresent) {
    Get-PackageProvider -Name Nuget -ForceBootstrap | Out-Null
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    if (-not (Get-Module -Name PSDepend -ListAvailable)) {
        Install-Module -Name PSDepend -Repository PSGallery -Scope CurrentUser
    }
    Invoke-PSDepend -Path './requirements.psd1' -Install -Import -Force -WarningAction SilentlyContinue
}

# Execute psake task(s)
$psakeFile = './psakeFile.ps1'
if ($PSCmdlet.ParameterSetName -eq 'Help') {
    Get-PSakeScriptTasks -buildFile $psakeFile |
    Format-Table -Property Name, Description, Alias, DependsOn
} else {
    Invoke-psake -buildFile $psakeFile -taskList $Task -nologo
    exit ( [int]( -not $psake.build_success ) )
}