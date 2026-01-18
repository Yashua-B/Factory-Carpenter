# GitHub CLI - Quick Start Guide

## ✅ Setup Complete!

GitHub CLI is installed and authenticated as **Yashua-B**.

## 🚀 Quick Commands

### Basic Repository Operations

```powershell
# List your repositories
gh repo list

# Create a new public repository
gh repo create my-new-repo --public

# Create a new private repository
gh repo create my-new-repo --private

# Create and clone immediately
gh repo create my-new-repo --public --clone

# Clone any repository
gh repo clone owner/repo-name

# View repository details
gh repo view owner/repo-name
```

### Using Helper Functions

Load the helper functions:
```powershell
. .\gh-helpers.ps1
```

Then use:
```powershell
# Create a new repo (with helper)
New-GHRepo -Name "my-repo" -Public

# Clone one of your repos
Clone-MyRepo -RepoName "Portfolio_framework"

# Create repo, clone, and cd into it
Init-GHRepo -Name "my-project" -Description "My awesome project"

# List your repos
Get-MyRepos -Limit 10
```

### Pull Requests

```powershell
# Create a PR from current branch
gh pr create --title "My changes" --body "Description"

# List PRs
gh pr list

# View a specific PR
gh pr view 123
```

### Issues

```powershell
# Create an issue
gh issue create --title "Bug report" --body "Description"

# List issues
gh issue list
```

## 📝 Making GitHub CLI Always Available

To use `gh` without adding to PATH each time, add this to your PowerShell profile:

```powershell
# Add to your profile: $PROFILE
$env:Path += ";C:\Program Files\GitHub CLI\"
```

Or permanently add `C:\Program Files\GitHub CLI\` to your system PATH.

## 📚 Full Documentation

See `GITHUB_CLI_GUIDE.md` for comprehensive documentation.

## 🎯 Common Workflows

### Create and Push a New Project
```powershell
# Create repo
gh repo create my-project --public --clone
cd my-project

# Initialize and push
git init
# Add files...
git add .
git commit -m "Initial commit"
git push -u origin main
```

### Clone and Work on Existing Repo
```powershell
gh repo clone Yashua-B/Portfolio_framework
cd Portfolio_framework
# Make changes...
git checkout -b feature-branch
# Commit and push
gh pr create
```

---

**You're all set!** Start using `gh` commands in your terminal. 🎉
