# PowerShell and Scripting

> Yahyaoui Med Aziz | 07162025.

<details>
  <summary>Links to resources:</summary>
  
  - Docks:

    - [An A-Z Index of Windows PowerShell commands](https://ss64.com/ps/)
    - [Microsoft Learn. "Basic concepts - PowerShell"](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-03?view=powershell-7.5)
    - [TechTarget. "Top PowerShell commands you must know, with cheat sheet](https://www.techtarget.com/searchwindowsserver/tip/Top-PowerShell-commands-you-must-know-with-cheat-sheet)
    - [ScriptRunner. "PowerShell Scripting: 5 Best Practices for Clean Code.](https://www.scriptrunner.com/resources/blog/5-powershell-scripting-best-practices)

- Videos:
-

</details>

## 🔹 **Foundations**

### Introduction

PowerShell is a powerful cross-platform scripting language and command-line shell developed by Microsoft. It is designed for system administration, automation, and configuration management. This document provides a comprehensive overview of PowerShell fundamentals, essential scripting concepts, and practical examples to help users leverage its capabilities for efficient task automation.

#### What is PowerShell?

PowerShell combines command-line shell features with a scripting language and a structured data format (like JSON, CSV, and XML) for managing systems. It is built on the .NET framework and provides access to various data stores through its provider model, which presents data in a consistent file system-like format.

PowerShell is an interpreted language. While it does compile scripts to bytecode, which is then interpreted, it doesn't produce machine code directly, and it's considered a scripting language.

- **PowerShell's Interpretation:**
  PowerShell scripts are first parsed and compiled into an intermediate representation (bytecode).
  This bytecode is then interpreted by the PowerShell runtime.
  While PowerShell does include JIT (Just-In-Time) compilation for performance optimizations in loops, it's not a primary characteristic like in fully compiled languages.
- **Scripting Language:**
  PowerShell's primary function is for automating tasks and managing systems, which is typical of scripting languages.
  It's designed for ease of use and quick execution of commands and scripts.
- **.NET Integration:**
  PowerShell leverages the .NET framework, allowing it to utilize .NET libraries and functionalities.
  This integration makes it powerful for managing Windows systems and working with .NET objects.

#### Where we can utilize powershell

PowerShell is a versatile tool that can be used in **many real-world scenarios** across IT, DevOps, cybersecurity, and even daily productivity. Here are some key areas where PowerShell shines:

- 1. System & Server Administration

  - **User & Group Management** – Create, modify, and delete AD users in bulk.
  - **Service & Process Control** – Start, stop, or monitor services remotely.
  - **Disk & Storage Management** – Check disk space, format drives, manage partitions.
  - **Event Logs & Monitoring** – Filter and analyze system logs for troubleshooting.

- 2. Automation & Scripting

  - **Scheduled Tasks** – Automate backups, log cleanups, and reports.
  - **File Operations** – Batch rename, move, or modify thousands of files.
  - **Software Deployment** – Install/uninstall apps silently across multiple machines.

- 3. Cloud & DevOps

  - **Azure & AWS Management** – Control cloud resources (VMs, storage, networks) via PowerShell modules.
  - **CI/CD Pipelines** – Integrate scripts into **Azure DevOps, GitHub Actions, or Jenkins**.
  - **Docker & Kubernetes** – Manage containers with PowerShell (e.g., `docker ps` alternative).

- 4. Security & Compliance

  - **Auditing & Hardening** – Check security policies, firewall rules, and patch levels.
  - **Malware Detection** – Scan for suspicious processes/files.
  - **Active Directory Security** – Find stale accounts, enforce password policies.

- **5. Data Processing & Reporting**

  - **CSV/JSON/XML Handling** – Parse, filter, and export data efficiently.
  - **Generate Reports** – Automate **Excel/PDF reports** for system health, licenses, etc.
  - **API Interactions** – Fetch and process web data (REST APIs).

- **6. Troubleshooting & Diagnostics**

  - **Network Checks** – Test connectivity, DNS, ports (`Test-NetConnection`).
  - **Performance Monitoring** – Track CPU, memory, and disk usage.
  - **Remote Support** – Fix issues on multiple PCs via PowerShell Remoting (`Enter-PSSession`).

- **7. Developer Productivity**
  - **Code Generation** – Auto-create project structures, config files.
  - **Git Automation** – Commit, push, branch via scripts.
  - **Testing & Validation** – Run unit tests, check logs in CI pipelines.

#### Why Use PowerShell Over Other Tools?

✅ **Deep Windows Integration** (but works on Linux/macOS too!).  
✅ **Object-Based Pipeline** (not just text like Bash).  
✅ **Massive Module Library** (Azure, Exchange, SQL, etc.).  
✅ **Remote Management** (manage hundreds of servers at once).

#### Conclusion

PowerShell is an indispensable tool for IT professionals and developers alike, offering robust capabilities for automation, system management, and data manipulation. By understanding its core concepts, leveraging essential cmdlets, and adhering to scripting best practices, users can significantly enhance their productivity and streamline complex administrative tasks. Continuous learning and practical application are key to mastering PowerShell and unlocking its full potential.

### 🚀 Getting Started with PowerShell 7

PowerShell 7 is the latest cross-platform version, available for Windows, Linux, and macOS. Here’s how to install it on Windows and Linux:

##### 🖥️ **Windows Installation**

1. **Using MSI Installer (Recommended):**

- Go to the [PowerShell GitHub Releases](https://github.com/PowerShell/PowerShell/releases).
- Download the latest `.msi` installer for Windows.
- Run the installer and follow the prompts.

2. **Via Winget (Windows Package Manager):**

```powershell
winget install --id Microsoft.Powershell --source winget
```

3. **Verify Installation:**

- Open a new PowerShell window and run:
  ```powershell
  $PSVersionTable.PSVersion
  ```
- You should see version 7.x.x.

##### 🐧 **Linux Installation**

PowerShell 7 supports major Linux distributions. Here’s a quick guide for Ubuntu and CentOS:

- **Ubuntu/Debian:**

  ```bash
  # Download and install Microsoft repository GPG keys
  wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
  sudo dpkg -i packages-microsoft-prod.deb

  # Update and install PowerShell
  sudo apt-get update
  sudo apt-get install -y powershell

  # Start PowerShell
  pwsh
  ```

- **CentOS/RHEL:**

  ```bash
  # Register the Microsoft RedHat repository
  sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm

  # Install PowerShell
  sudo yum install -y powershell

  # Start PowerShell
  pwsh
  ```

---

## 🔍 Exploring Cmdlets & Command Discovery

Whether you're coming from a Linux/Unix background or you're completely new to the command-line world, PowerShell has your back. One of its biggest strengths is how _discoverable_ everything is — you don’t need to memorize hundreds of commands like you're prepping for a hacker exam. PowerShell lets you **ask questions and learn as you go**, almost like it’s designed to teach itself.

At the heart of it all are **cmdlets** — simple, consistent commands that follow a `Verb-Noun` format like `Get-Process`, `Set-Location`, or `Remove-Item`. If that sounds strange at first, don't worry — the logic kicks in fast.

In this section, we’ll dig into:

- How to _find_ commands (`Get-Command`)
- How to _ask for help_ (`Get-Help`, `-Examples`, etc.)
- How to _peek inside_ objects (`Get-Member`)
- How to _pluck out_ what you need (`Select-Object`, `.Property` access)

By the end of this, you'll know how to explore PowerShell the way hackers dig into filesystems — with a flashlight, not guesswork.

> Inspired by: John Hammond’s Playlist – Episode 1: [Intro to PowerShell](https://youtu.be/TUNNmVeyjW0?list=PL1H1sBF1VAKXqO_N3ZNP0aL15miJcUhw7)

---

### 📂 NAVIGATION

| **Linux** | **PowerShell**        | **Alias**   | Description             |
| --------- | --------------------- | ----------- | ----------------------- |
| `pwd`     | `Get-Location`        | `gl`, `pwd` | Show current directory  |
| `cd`      | `Set-Location <path>` | `cd`, `sl`  | Change directory        |
| `ls`      | `Get-ChildItem`       | `ls`, `dir` | List directory contents |
| `..`      | `Set-Location ..`     | `cd ..`     | Go up one directory     |

---

### 🧱 FILE & DIRECTORY MANAGEMENT

| **Linux**  | **PowerShell**                           | **Alias**     | Description          |
| ---------- | ---------------------------------------- | ------------- | -------------------- |
| `mkdir`    | `New-Item -ItemType Directory`           | `mkdir`, `md` | Create new directory |
| `touch`    | `New-Item -ItemType File -Name file.txt` | —             | Create empty file    |
| `cp`       | `Copy-Item file1.txt dest/`              | `cp`          | Copy file            |
| `mv`       | `Move-Item file.txt dest/`               | `mv`          | Move/rename file     |
| `rm`       | `Remove-Item file.txt`                   | `rm`, `del`   | Delete file          |
| `cat`      | `Get-Content file.txt`                   | `cat`, `gc`   | Read file content    |
| `echo txt` | `Write-Output "text"`                    | `echo`        | Print to output      |

---

### 📖 HELP & DISCOVERY

| **Linux** | **PowerShell**                | **Alias**     | Description                   |
| --------- | ----------------------------- | ------------- | ----------------------------- |
| `man`     | `Get-Help <cmdlet>`           | `man`, `help` | Show help about a cmdlet      |
| `--help`  | `Get-Help <cmdlet> -Examples` | —             | Show usage examples           |
| `which`   | `Get-Command <name>`          | —             | Show full path or cmdlet info |
| `alias`   | `Get-Alias`                   | —             | List all aliases              |

---

### 🧠 John Hammond Pro Tips & Power Tips

```powershell
# Find real cmdlet behind alias
Get-Alias ls | Format-List *

# List all available commands
Get-Command

# Find all commands related to 'Item'
Get-Command -Noun Item

# Discover object members (like properties, methods)
Get-Process | Get-Member

# Chain cmdlets & extract properties
Get-Service | Select-Object Name, Status

# Dot notation on objects
(Get-Process)[0].Name

# List members of a variable (object introspection)
$var | Get-Member

# List only properties
$var | Get-Member -MemberType Properties
```

> 🧠 **Object-Oriented Pipeline**:
> Unlike Bash, PowerShell passes **.NET objects**, not raw text. That means you can inspect, filter, and manipulate structured data directly in the pipeline!

---

### 👤 USER & SYSTEM

| **Linux**  | **PowerShell**                                                               | **Alias**   | Description                      |
| ---------- | ---------------------------------------------------------------------------- | ----------- | -------------------------------- |
| `whoami`   | `whoami` or `[System.Security.Principal.WindowsIdentity]::GetCurrent().Name` | `whoami`    | Show current user                |
| `hostname` | `hostname`                                                                   | —           | Show system hostname             |
| `top`      | `Get-Process`                                                                | `ps`, `gps` | View running processes           |
| `kill PID` | `Stop-Process -Id <PID>`                                                     | —           | Kill a process                   |
| `uptime`   | `Get-Uptime` (v7+)                                                           | —           | Show how long system has been up |

---

### 🌐 NETWORKING

| **Linux**     | **PowerShell**                     | **Alias**     | Description             |
| ------------- | ---------------------------------- | ------------- | ----------------------- |
| `ping`        | `Test-Connection <host>`           | —             | Ping a host             |
| `ifconfig/ip` | `Get-NetIPAddress`                 | —             | Show IP addresses       |
| `netstat`     | `Get-NetTCPConnection`             | —             | Show TCP connections    |
| `curl`        | `Invoke-WebRequest`                | `curl`, `iwr` | HTTP requests           |
| `scp`         | `Copy-Item -ToSession` w/ remoting | —             | Secure copy via session |
| `traceroute`  | `Trace-Route <host>` (v7 module)   | —             | Trace network route     |

---

### 📦 PACKAGES & SOFTWARE MGMT

| **Linux (APT/YUM)**    | **PowerShell**                   | **Alias** | Description                         |
| ---------------------- | -------------------------------- | --------- | ----------------------------------- |
| `apt install nmap`     | `Install-Package nmap`           | —         | Install a package (provider needed) |
| `apt list --installed` | `Get-Package`                    | —         | Show installed packages             |
| `apt update`           | `Update-Package` (with provider) | —         | Update software                     |

> 💡 Tip: You can use Chocolatey, Winget, or `PackageManagement` as providers.
> Example (with Chocolatey):

```powershell
choco install nmap
```

---

### 🧠 Final Thoughts

- PowerShell is **friendly to Linux users** thanks to aliases and logical command mapping.
- Learn to think in **objects**, not strings: `| Get-Member`, `Select-Object`, and `Format-*` are your friends.
- **Explore** and **experiment**: Use `Get-Help`, `Get-Command`, and aliases to learn interactively.
- **John Hammond’s approach** = practical demos, malware automation, C2 tooling. Follow his mindset.

---

> 🧱 Next Steps?

- Build your own alias list (e.g. `alias ll="Get-ChildItem -Force"`)
- Try to recreate your Bash habits in PowerShell syntax
- Dive into scripting basics and `for`, `if`, `try/catch`, and `$env:` later

---

### ⚙️ Profiles & Execution Policies

PowerShell allows users to customize their shell environment and control script execution through **profiles** and **execution policies**.

Whether you're coming from a Linux background or are completely new to shell scripting, understanding how PowerShell handles startup customization and script permissions is essential for both daily automation and secure administration.

#### 🔐 Execution Policy: Controlling Script Permissions

Execution policies are a safety feature in PowerShell to control how scripts are executed. They’re not a security system but more of a preventive barrier.

| **Policy**     | **Description**                                                              |
| -------------- | ---------------------------------------------------------------------------- |
| `Restricted`   | Default. No scripts can run. Only interactive commands allowed.              |
| `AllSigned`    | Only scripts signed by a trusted publisher can be run.                       |
| `RemoteSigned` | Locally created scripts can run. Downloaded ones must be signed.             |
| `Unrestricted` | All scripts can run. Shows a warning when running downloaded scripts.        |
| `Bypass`       | Nothing is blocked and no warnings are shown. Not recommended for daily use. |

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

---

#### 🧰 Profiles: Customize Your PowerShell Environment

A **PowerShell profile** is a script that runs every time you open a new PowerShell session. It’s useful for setting aliases, loading functions, customizing prompts, etc.

🔸 **Check if Profile Exists**:

```powershell
Test-Path $PROFILE # by default returns false
$PROFILE | select-object *
```

🔸 **Create Profile (if not exists)**:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
```

🔸 **Open Profile for Editing**:

```powershell
notepad $PROFILE
```

📌 Example content you can add:

```powershell
# Custom Aliases
Set-Alias gs Get-Service
Set-Alias ll Get-ChildItem

# Welcome Message
Write-Host "Welcome back, Aziz!" -ForegroundColor Cyan
```

📝 There are **different profiles per host type and user**. To check all profile paths:

```powershell
$PROFILE | Format-List *
```

#### SHould Know This:

> **"security use cases"** in the context of PowerShell **Profiles & Execution Policies**, in practical ways these features are used to _harden_, _monitor_, or _protect_ PowerShell usage on a system.

Here’s a quick breakdown of what I could expand on under “Security Use Cases”:

---

##### 🛡️ Security Use Cases (to expand later)

1.  **Preventing Unauthorized Script Execution**

- Set execution policy to `AllSigned` or `RemoteSigned` to reduce risk of running malicious or tampered scripts.
- Ideal for enterprise environments where scripts must be reviewed/signed before deployment.

2.  **Detecting Malicious Profile Modifications**

- Since `$PROFILE` runs automatically, attackers often backdoor it.
- **Defensive use case**: Monitor changes to `$PROFILE` with file integrity tools (e.g., Windows Defender, Sysmon, or custom script hashing).

3.  **Enforcing Least Privilege**

- Apply restricted execution policies only for _CurrentUser_ and use signed scripts for _AllUsers_ to control risk without limiting admins globally.

4.  **Hardening Developer Environments**

- Disable risky aliases or redefine them safely (e.g., override `rm` to prevent accidental deletion).
- Add logging/tracing to your profile (e.g., log every session start or command history to a file).

5.  **Incident Response Shortcut in Profile**

- Add quick aliases/functions to your profile for scanning logs, checking for suspicious processes, or dumping logs for review.

Example:

```powershell
function quickIR {
  Get-EventLog -LogName Security -Newest 100 | Out-File "$env:USERPROFILE\Desktop\IR_Logs.txt"
}
```

---

## 🧪 Aliases, Variables, Types & PSDrives

PowerShell might look like it borrowed from Bash at first glance — especially with familiar aliases like `ls`, `cd`, and `echo`. But under the hood, it’s a **fully object-oriented scripting environment**. This section will explore:

- 🔗 **Aliases** – shortcuts that map to real cmdlets
- 🧠 **Variables** – flexible containers (with some PowerShell quirks)
- 🧬 **Data types** – more than just strings!
- 💾 **PSDrives** – virtual file systems beyond your `C:\` drive

> Whether you come from a **Linux/Unix shell background** or you're **new to CLI altogether**, this will help you build a strong PowerShell foundation.

---

#### **Aliases**

Aliases in PowerShell are **nicknames** or **shortcuts** for full cmdlet names. They're great for saving time when typing interactively — but in scripts, they can **hurt readability and maintainability**.

> 📌 Why aliases exist:

- To make PowerShell feel more familiar for users from Linux (`ls`, `cat`, etc.) or old-school CMD (`dir`, `del`, `cls`)
- To save time when typing commands manually
- To bridge users into the full cmdlet structure

> 🧠 How to view aliases:

```powershell
Get-Alias
```

Filter to specific alias:

```powershell
Get-Alias ls
```

See all aliases for a particular cmdlet:

```powershell
Get-Alias | Where-Object {$_.Definition -eq 'Get-ChildItem'}
```

> 💡 Create your own alias:

```powershell
Set-Alias goHome Set-Location -Value "C:\Users\$env:USERNAME"
```

> ⚠️ **Note:** Aliases only exist **for the current session** unless you persist them in your PowerShell profile.

##### 📛 Remove alias:

```powershell
Remove-Item Alias:yourAliasName
```

---

#### **Variables**

PowerShell variables are super **flexible**, **typed dynamically**, and **easy to define**. They start with a `$` and can store anything — from strings and numbers to entire objects, scripts, or outputs of cmdlets.

##### ✅ Basic Variable Examples

```powershell
$name = "Aziz"
$age = 24
$isReady = $true
```

> 📌 You don't need to define the type explicitly — PowerShell figures it out for you.

##### 🔁 Assigning Command Output

```powershell
$date = Get-Date
$services = Get-Service | Where-Object {$_.Status -eq "Running"}
```

> Now `$date` holds a `[datetime]` object and `$services` holds a collection of `[ServiceController]` objects.

##### 🧪 Check a Variable's Type

```powershell
$services.GetType()
```

Or use:

```powershell
$services | Get-Member
```

---

##### ⚙️ Environment Variables

Access system environment variables easily using the `env:` drive:

```powershell
$env:USERNAME
$env:PATH
```

You can set them too (but changes only last for the current session):

```powershell
$env:MY_VAR = "PowerShellIsFun"
```

---

##### 📌 Pro Tips

- Use `Write-Output`, not `echo` (even if they work the same). Avoid aliases in scripts!
- Use `Clear-Variable varName` or `$varName = $null` to reset a variable.
- Use `Get-Variable` to explore variables in scope:

  ```powershell
  Get-Variable
  Get-Variable myVar
  ```

---

### 🧬 Types, Casting, and Type Accelerators in PowerShell

PowerShell is **dynamically typed**, but behind the scenes it’s built on **.NET**, which means it has access to **strong types** too — and you can control them when needed.

#### 🔹 1. Dynamic Typing (Default)

You usually don't declare a variable's type:

```powershell
$number = 42         # System.Int32
$text = "PowerShell" # System.String
```

PowerShell infers types at runtime.

---

#### 🔸 2. Strong Typing (Optional)

You _can_ force a variable to a specific type:

```powershell
[int]$age = 25
[string]$name = "Aziz"
[bool]$isAdmin = $false
```

If the value can't convert → you’ll get an error. For example:

```powershell
[int]$broken = "abc"  # ❌ Throws: Cannot convert value "abc" to type "System.Int32".
```

---

#### 🔁 3. Type Casting

Casting is converting one type to another using square brackets:

```powershell
[double]42        # = 42.0
[string]42        # = "42"
[int]3.99         # = 3
[bool]"true"      # = True
```

Be careful — casting strings to types may not behave as expected:

```powershell
[int]"0xFF"       # ❌ = 0 (not 255)
[int]::Parse("0xFF", [System.Globalization.NumberStyles]::HexNumber) # ✅ = 255
```

---

#### 🚀 4. Type Accelerators

Type Accelerators are **shorthand** for full .NET types. They’re like fast paths to .NET classes.

> ✅ Common Accelerators:

| Accelerator   | Full Type                                 |
| ------------- | ----------------------------------------- |
| `[int]`       | `[System.Int32]`                          |
| `[string]`    | `[System.String]`                         |
| `[datetime]`  | `[System.DateTime]`                       |
| `[psobject]`  | `[System.Management.Automation.PSObject]` |
| `[regex]`     | `[System.Text.RegularExpressions.Regex]`  |
| `[hashtable]` | `[System.Collections.Hashtable]`          |
| `[xml]`       | `[System.Xml.XmlDocument]`                |
| `[array]`     | `[System.Array]`                          |

Example with `[datetime]`:

```powershell
$birthday = [datetime]"2000-01-01"
$birthday.AddYears(25)
```

> 📜 To list all available type accelerators:

```powershell
[psobject].Assembly.GetType("System.Management.Automation.TypeAccelerators")::Get
```

---

### 🧩 Hashtables in PowerShell

A **hashtable** is a collection of **key-value pairs** — like a mini-database or a JSON object.

---

#### 🔹 1. Creating a Hashtable

```powershell
$person = @{
    Name = "Aziz"
    Age = 25
    Country = "Tunisia"
}
```

Keys are **strings by default**, and values can be of any type.

---

#### 🔸 2. Accessing Values

```powershell
$person["Name"]     # → "Aziz"
$person.Age         # → 25 (dot notation)
```

---

#### 🔄 3. Adding & Updating Values

```powershell
$person["Hobby"] = "Gaming"         # Add new key-value pair
$person.Age = 26                    # Update existing value
```

---

#### ❌ 4. Removing Keys

```powershell
$person.Remove("Hobby")             # Deletes the key 'Hobby'
```

---

#### 🔍 5. Looping Over a Hashtable

```powershell
foreach ($key in $person.Keys) {
    Write-Host "$key => $($person[$key])"
}
```

You can also loop over `GetEnumerator()`:

```powershell
foreach ($entry in $person.GetEnumerator()) {
    Write-Host "$($entry.Key) = $($entry.Value)"
}
```

---

#### 🔐 6. Check for Existence

```powershell
$person.ContainsKey("Age")       # → True
$person.ContainsValue("Aziz")    # → True
```

---

#### 🔄 7. Merging Hashtables

```powershell
$job = @{ Role = "Dev"; Company = "Data Thunder" }
$combined = $person + $job
```

> Note: If both HashTables share keys, PowerShell will throw an error unless you handle it manually.

---

### **PSDrives**.


---


## Notes:

> ⚠️ **Warning:**
> "message": "'echo' is an alias of 'Write-Output'. Alias can introduce possible problems and make scripts hard to maintain. Please consider changing alias to its full content.",

Avoid using aliases like `echo`, `ls`, or `rm` in scripts. Use full cmdlets (`Write-Output`, `Get-ChildItem`, `Remove-Item`) for clarity and maintainability.

That’s PowerShell being a responsible adult 😄 — it's nudging you toward **best practices**.

Here’s what’s going on:

### 🛠️ The Message:

> `'echo' is an alias of 'Write-Output'. Alias can introduce possible problems and make scripts hard to maintain.`

### 💡 What it means:

PowerShell allows **aliases** (like `echo`, `ls`, `pwd`, etc.) for convenience, but in **scripts or production code**, it’s better to use the **full cmdlet names**.

Why?

#### 🔍 Here's why aliases can be problematic:

- ✅ **Not universal:** An alias might not exist on another system if it's been removed or customized.
- ✅ **Less readable:** `echo` doesn’t clearly express intent like `Write-Output` does.
- ✅ **Ambiguity:** Some aliases clash with native commands in other shells (like Bash's `echo`, which behaves differently).

---

### ✅ Best Practice:

**Use full cmdlets** in scripts, but aliases are fine for quick one-liners or interactive use in the terminal.

So instead of:

```powershell
echo "Hello World"
```

Use:

```powershell
Write-Output "Hello World"
```

---

### 🧠 Pro Tip:

You can find the full name of any alias like this:

```powershell
Get-Alias echo
```

It will return:

```text
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           echo -> Write-Output
```

---

Would you like me to add a “⚠️ Aliases in Scripts” box in your PowerShell.md? Could look like this:

```md
> ⚠️ **Avoid aliases in scripts!**
>
> While `echo`, `ls`, and `pwd` are handy for quick typing, always use the full cmdlets (`Write-Output`, `Get-ChildItem`, `Get-Location`) in scripts to ensure clarity, portability, and maintainability.
```
