# GitHub CLI Helper Functions
# Source this file in your PowerShell profile or run: . .\gh-helpers.ps1

# Ensure GitHub CLI is in PATH
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    $env:Path += ";C:\Program Files\GitHub CLI\"
}

# Quick repository creation with clone
function New-GHRepo {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [switch]$Private,
        [string]$Description = "",
        [switch]$Clone
    )
    
    $visibility = if ($Private) { "--private" } else { "--public" }
    $desc = if ($Description) { "--description `"$Description`"" } else { "" }
    $cloneFlag = if ($Clone) { "--clone" } else { "" }
    
    gh repo create $Name $visibility $desc $cloneFlag
}

# Quick clone by name (searches your repos)
function Clone-MyRepo {
    param(
        [Parameter(Mandatory=$true)]
        [string]$RepoName
    )
    
    $username = gh api user --jq .login
    gh repo clone "$username/$RepoName"
}

# Create a new repo and initialize it
function Init-GHRepo {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [switch]$Private,
        [string]$Description = ""
    )
    
    $visibility = if ($Private) { "--private" } else { "--public" }
    $desc = if ($Description) { "--description `"$Description`"" } else { "" }
    
    Write-Host "Creating repository: $Name" -ForegroundColor Cyan
    gh repo create $Name $visibility $desc --clone
    
    if ($LASTEXITCODE -eq 0) {
        Set-Location $Name
        Write-Host "Repository created and cloned! You're now in the repo directory." -ForegroundColor Green
    }
}

# Quick PR creation from current branch
function New-PR {
    param(
        [string]$Title = "",
        [string]$Body = "",
        [string]$Base = "main",
        [switch]$Draft
    )
    
    if (-not $Title) {
        $branch = git branch --show-current
        $Title = "Update from $branch"
    }
    
    $draftFlag = if ($Draft) { "--draft" } else { "" }
    $bodyFlag = if ($Body) { "--body `"$Body`"" } else { "" }
    
    gh pr create --title $Title --base $Base $bodyFlag $draftFlag
}

# List your repositories with more info
function Get-MyRepos {
    param(
        [int]$Limit = 20
    )
    
    gh repo list --limit $Limit
}

# Quick issue creation
function New-Issue {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Title,
        [string]$Body = "",
        [string[]]$Labels = @()
    )
    
    $bodyFlag = if ($Body) { "--body `"$Body`"" } else { "" }
    $labelFlag = if ($Labels.Count -gt 0) { "--label $($Labels -join ',')" } else { "" }
    
    gh issue create --title $Title $bodyFlag $labelFlag
}

Write-Host "GitHub CLI helpers loaded! Available functions:" -ForegroundColor Green
Write-Host "  New-GHRepo      - Create a new repository" -ForegroundColor Cyan
Write-Host "  Clone-MyRepo    - Clone one of your repositories" -ForegroundColor Cyan
Write-Host "  Init-GHRepo     - Create repo, clone, and cd into it" -ForegroundColor Cyan
Write-Host "  New-PR          - Create a pull request from current branch" -ForegroundColor Cyan
Write-Host "  Get-MyRepos     - List your repositories" -ForegroundColor Cyan
Write-Host "  New-Issue       - Create an issue" -ForegroundColor Cyan
