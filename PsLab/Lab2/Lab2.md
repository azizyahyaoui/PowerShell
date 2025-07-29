# Lab2

- ⚠️  Should change the Execution Policy safely to be able running our scripts.
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```


### ⚙️ Profiles & Execution Policies


🔸 **Check Current Policy**:

```powershell
Get-ExecutionPolicy
```

🔸 **Set Policy (Current User Scope)**:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

> ⚠️ It's best to avoid setting `Unrestricted` or `Bypass` globally. Use `CurrentUser` scope during learning/testing.

- To know more about execution policies:

```powershell
 Get-Help about_Execution_Policies
```

---

#### 🧰 Profiles: Customize Your PowerShell Environment

A **PowerShell profile** is a script that runs every time you open a new PowerShell session. It’s useful for setting aliases, loading functions, customizing prompts, etc.

🔸 **Check if Profile Exists**:

```powershell
Test-Path $PROFILE
```

🔸 **Create Profile (if not exists)**:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
```

🔸 **Open Profile for Editing**:

> In this location: `CurrentUserCurrentHost : C:\Users\userName\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

```powershell
notepad $PROFILE
```

📌 Example content you can add:

```powershell
# Custom Aliases
Set-Alias ll Get-ChildItem

# Welcome Message
Write-Host "Welcome back, Aziz!" -ForegroundColor Cyan

Get-Data

```

📝 There are **different profiles per host type and user**. To check all profile paths:

```powershell
$PROFILE | Format-List *
```

---
