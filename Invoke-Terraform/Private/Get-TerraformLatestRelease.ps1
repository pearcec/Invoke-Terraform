function Get-TerraformLatestRelease {
    $headers = @{
        Accept = 'application/vnd.github.v3+json'
    }

    $response = Invoke-RestMethod 'https://api.github.com/repos/hashicorp/terraform/releases/latest' -Method 'GET' -Headers $headers
    $latest = $response.name.substring(1)
    return $latest
}