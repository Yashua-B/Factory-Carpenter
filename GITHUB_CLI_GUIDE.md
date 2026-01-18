# GitHub CLI Quick Reference Guide

GitHub CLI (`gh`) has been successfully installed! Here's how to use it.

## 🔐 Authentication

**Complete the login process:**
1. Run: `gh auth login`
2. Copy the one-time code that appears
3. Open the URL in your browser (or it may open automatically)
4. Paste the code and authorize the CLI

**Check authentication status:**
```bash
gh auth status
```

**Logout:**
```bash
gh auth logout
```

## 📦 Repository Management

### Create a New Repository
```bash
# Public repository
gh repo create my-repo-name --public

# Private repository
gh repo create my-repo-name --private

# Create with description
gh repo create my-repo-name --public --description "My awesome project"

# Create and clone immediately
gh repo create my-repo-name --public --clone
```

### Clone Repositories
```bash
# Clone your own repo
gh repo clone username/repo-name

# Clone any public repo
gh repo clone owner/repo-name

# Clone to specific directory
gh repo clone owner/repo-name ./my-folder
```

### List Repositories
```bash
# List your repositories
gh repo list

# List repositories for a specific user
gh repo list username

# List with more details
gh repo list --limit 100
```

### View Repository Info
```bash
gh repo view owner/repo-name
gh repo view owner/repo-name --web  # Open in browser
```

### Fork a Repository
```bash
gh repo fork owner/repo-name
```

### Delete a Repository
```bash
gh repo delete owner/repo-name
```

## 🐛 Issues & Pull Requests

### Create an Issue
```bash
gh issue create --title "Bug: Something broken" --body "Description here"
gh issue create --title "Feature: New thing" --body "Description" --label "enhancement"
```

### List Issues
```bash
gh issue list
gh issue list --state closed
gh issue list --assignee @me
```

### Create a Pull Request
```bash
# From current branch
gh pr create --title "My PR" --body "Description"

# With specific base branch
gh pr create --base main --title "My PR" --body "Description"

# Create as draft
gh pr create --draft --title "WIP: My PR"
```

### List Pull Requests
```bash
gh pr list
gh pr list --state merged
gh pr view 123  # View specific PR
```

### Merge a Pull Request
```bash
gh pr merge 123 --squash
gh pr merge 123 --merge
gh pr merge 123 --rebase
```

## 🔍 Other Useful Commands

### View Your Profile
```bash
gh api user
```

### Search Repositories
```bash
gh search repos "language:javascript stars:>1000"
```

### Work with Gists
```bash
gh gist create myfile.txt
gh gist list
```

### View Releases
```bash
gh release list
gh release view v1.0.0
gh release create v1.0.1 --title "New Release"
```

## 💡 Tips

1. **Get help for any command:**
   ```bash
   gh repo create --help
   ```

2. **Use aliases for common operations:**
   ```bash
   # Add to your PowerShell profile
   function gh-new { gh repo create $args --public --clone }
   ```

3. **Set default editor:**
   ```bash
   gh config set editor "code --wait"
   ```

4. **Enable autocomplete (PowerShell):**
   ```bash
   gh completion --shell powershell | Out-String | Invoke-Expression
   ```

## 🚀 Quick Start Workflow

1. **Create and initialize a new repo:**
   ```bash
   gh repo create my-project --public --clone
   cd my-project
   git init
   # Add files, commit, push
   ```

2. **Clone and work on existing repo:**
   ```bash
   gh repo clone owner/repo-name
   cd repo-name
   # Make changes
   git checkout -b feature-branch
   # Commit and push
   gh pr create
   ```

---

**Note:** After installation, you may need to restart your terminal or run:
```powershell
$env:Path += ";C:\Program Files\GitHub CLI\"
```

Or add `C:\Program Files\GitHub CLI\` to your system PATH permanently for automatic access.
