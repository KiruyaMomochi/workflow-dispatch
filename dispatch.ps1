#! /usr/bin/env pwsh
param (
    [Parameter(Mandatory)]
    [string]
    $Token,
    [Parameter(Mandatory)]
    [string]
    $Repository,
    [Parameter(Mandatory)]
    [string]
    $Workflow
)

Invoke-RestMethod `
    -Method Post `
    -Headers @{Accept='application/vnd.github.v3+json'; `
               Authorization="Bearer $Token"} `
    -Body '{"ref": "master"}' `
    -Uri "https://api.github.com/repos/$Repository/actions/workflows/$Workflow/dispatches"
