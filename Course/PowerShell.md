# PowerShell and Scripting

> Yahyaoui Med Aziz | 07162025.
> IDE: vscode, PowerShell ISE

<details>
  <summary>Links to resources:</summary>
  
  - Docks:

    - [An A-Z Index of Windows PowerShell commands](https://ss64.com/ps/)
    - [Microsoft Learn. "Basic concepts - PowerShell"](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-03?view=powershell-7.5)
    - [TechTarget. "Top PowerShell commands you must know, with cheat sheet](https://www.techtarget.com/searchwindowsserver/tip/Top-PowerShell-commands-you-must-know-with-cheat-sheet)
    - [ScriptRunner. "PowerShell Scripting: 5 Best Practices for Clean Code.](https://www.scriptrunner.com/resources/blog/5-powershell-scripting-best-practices)

- Videos:
- [John Hammond - Windows PowerShell Tutorials](https://www.youtube.com/playlist?list=PL1H1sBF1VAKXqO_N3ZNP0aL15miJcUhw7)
-

</details>

## 🔹 Foundations

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

> 🖥️ **Windows Installation**

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

> 🐧 **Linux Installation**

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

#### 🔍 Exploring Cmdlets & Command Discovery

Whether you're coming from a Linux/Unix background or you're completely new to the command-line world, PowerShell has your back. One of its biggest strengths is how _discoverable_ everything is — you don’t need to memorize hundreds of commands like you're prepping for a hacker exam. PowerShell lets you **ask questions and learn as you go**, almost like it’s designed to teach itself.

At the heart of it all are **cmdlets** — simple, consistent commands that follow a `Verb-Noun` format like `Get-Process`, `Set-Location`, or `Remove-Item`. If that sounds strange at first, don't worry — the logic kicks in fast.

In this section, we’ll dig into:

- How to _find_ commands (`Get-Command`)
- How to _ask for help_ (`Get-Help`, `-Examples`, etc.)
- How to _peek inside_ objects (`Get-Member`)
- How to _pluck out_ what you need (`Select-Object`, `.Property` access)

* **Cmdlets (Command-lets):** These are lightweight commands used in the PowerShell environment. Cmdlets follow a Verb-Noun naming convention (e.g., `Get-Command`, `Set-ExecutionPolicy`), making them easy to understand and discover.
* **Providers and Drives:** PowerShell providers allow access to data stores (like the file system, registry, or environment variables) as if they were file system drives. For example, the `FileSystem` provider allows navigation and manipulation of files and directories, while the `Alias` provider manages command aliases.
* **Pipelining:** PowerShell's most powerful feature is its ability to pipe objects from one cmdlet to another. Unlike traditional command-line interfaces that pipe text, PowerShell pipes objects, allowing for more structured and efficient data manipulation.
* **Variables:** Variables are used to store data in PowerShell. They are denoted by a dollar sign (`$`) followed by the variable name (e.g., `$myVariable`).
* **Aliases:** Aliases are alternate names for cmdlets or functions, providing shortcuts for frequently used commands (e.g., `gci` for `Get-ChildItem`).

By the end of this, you'll know how to explore PowerShell the way hackers dig into filesystems — with a flashlight, not guesswork.

> Inspired by: John Hammond’s Playlist – Episode 1: [Intro to PowerShell](https://youtu.be/TUNNmVeyjW0?list=PL1H1sBF1VAKXqO_N3ZNP0aL15miJcUhw7)

---

#### 📂 NAVIGATION

| **Linux** | **PowerShell**        | **Alias**   | Description             |
| --------- | --------------------- | ----------- | ----------------------- |
| `pwd`     | `Get-Location`        | `gl`, `pwd` | Show current directory  |
| `cd`      | `Set-Location <path>` | `cd`, `sl`  | Change directory        |
| `ls`      | `Get-ChildItem`       | `ls`, `dir` | List directory contents |
| `..`      | `Set-Location ..`     | `cd ..`     | Go up one directory     |

---

#### 🧱 FILE & DIRECTORY MANAGEMENT

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

#### 📖 HELP & DISCOVERY

| **Linux** | **PowerShell**                | **Alias**     | Description                   |
| --------- | ----------------------------- | ------------- | ----------------------------- |
| `man`     | `Get-Help <cmdlet>`           | `man`, `help` | Show help about a cmdlet      |
| `--help`  | `Get-Help <cmdlet> -Examples` | —             | Show usage examples           |
| `which`   | `Get-Command <name>`          | —             | Show full path or cmdlet info |
| `alias`   | `Get-Alias`                   | —             | List all aliases              |

---

### 🧠 Tips & Power Tips

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

#### 👤 USER & SYSTEM

| **Linux**  | **PowerShell**                                                               | **Alias**   | Description                      |
| ---------- | ---------------------------------------------------------------------------- | ----------- | -------------------------------- |
| `whoami`   | `whoami` or `[System.Security.Principal.WindowsIdentity]::GetCurrent().Name` | `whoami`    | Show current user                |
| `hostname` | `hostname`                                                                   | —           | Show system hostname             |
| `top`      | `Get-Process`                                                                | `ps`, `gps` | View running processes           |
| `kill PID` | `Stop-Process -Id <PID>`                                                     | —           | Kill a process                   |
| `uptime`   | `Get-Uptime` (v7+)                                                           | —           | Show how long system has been up |

---

#### 🌐 NETWORKING

| **Linux**     | **PowerShell**                     | **Alias**     | Description             |
| ------------- | ---------------------------------- | ------------- | ----------------------- |
| `ping`        | `Test-Connection <host>`           | —             | Ping a host             |
| `ifconfig/ip` | `Get-NetIPAddress`                 | —             | Show IP addresses       |
| `netstat`     | `Get-NetTCPConnection`             | —             | Show TCP connections    |
| `curl`        | `Invoke-WebRequest`                | `curl`, `iwr` | HTTP requests           |
| `scp`         | `Copy-Item -ToSession` w/ remoting | —             | Secure copy via session |
| `traceroute`  | `Trace-Route <host>` (v7 module)   | —             | Trace network route     |

---

#### 📦 PACKAGES & SOFTWARE MGMT

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

#### 🧠 Final Thoughts

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

#### ⚙️ Profiles & Execution Policies

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

#### 🧪 Aliases, Variables, Types & PSDrives

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

### **🧬 Types, Casting, and Type Accelerators in PowerShell**

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

### **🧩 Hashtables in PowerShell**

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

### **PSDrives(PowerShell Drives)**

In this section part, let’s mount into the world of **PowerShell Drives (PSDrives)** — they might look like file system paths, but they're much more than that. 🧭📁

PSDrives represent **data stores** you can browse and manipulate **as if they were file systems**, using standard navigation commands like `cd`, `ls`, and `dir`.

---

#### 🔍 What is a PSDrive?

A **PSDrive** is a _PowerShell abstraction layer_ over different types of data stores:

| Drive Name  | Description                        |
| ----------- | ---------------------------------- |
| `C:\`       | File system drive                  |
| `HKLM:`     | Registry (HKEY_LOCAL_MACHINE)      |
| `Env:`      | Environment variables              |
| `Alias:`    | All defined aliases                |
| `Function:` | User-defined or built-in functions |
| `Variable:` | All PowerShell variables           |
| `Cert:`     | X.509 certificate store            |

---

#### 📂 List All Drives

```powershell
Get-PSDrive
```

---

#### 🔄 Navigate Like a File System

```powershell
cd Env:
ls
```

You can read or write like you're in a directory:

```powershell
$env:USERNAME
$env:PATH = "$env:PATH;C:\Custom\Bin"
```

---

#### 📌 Useful Examples

##### ➤ Registry Access:

```powershell
cd HKCU:\Software
ls
```

##### ➤ Alias Drive:

```powershell
cd Alias:
ls | Where-Object { $_.Definition -like "*Get*" }
```

##### ➤ Variable Drive:

```powershell
cd Variable:
ls | Sort-Object Name
```

---

### Users and file Management:

Managing **permissions**, **users**, and **groups** in PowerShell on Windows works differently than in Linux. There’s **no `chmod`, `umask`, or `chown`**, for whom came from linux world, but you still have full control over **ACLs (Access Control Lists)**, **users**, and **groups** using PowerShell cmdlets. Let’s dive in:

---

#### 🔐 **1. File & Folder Permissions (ACLs)**

In PowerShell, permissions are handled using **ACLs (Access Control Lists)** via:

- `Get-Acl` – Get current permissions
- `Set-Acl` – Apply permissions
- `[System.Security.AccessControl.FileSystemAccessRule]` – Create custom rules

---

> 🔍 View Permissions

```powershell
Get-Acl "C:\Path\To\FileOrFolder"
```

> 📝 Changing Permissions:

```powershell
# Example: Grant FullControl to user 'john'
$acl = Get-Acl "C:\Path\To\Folder"
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("john", "FullControl", "Allow")
$acl.AddAccessRule($rule)
Set-Acl "C:\Path\To\Folder" $acl
```

> ✅ Add Permissions (Allow `Everyone` to read)

```powershell
$folder = "C:\TestFolder"
$acl = Get-Acl $folder
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone", "Read", "Allow")
$acl.AddAccessRule($rule)
Set-Acl $folder $acl
```

---

> ❌ Remove Permissions

```powershell
$acl.RemoveAccessRule($rule)
Set-Acl $folder $acl
```

> 🔹 `FullControl`, `Read`, `Write`, `Modify`, `ExecuteFile`, etc. are valid rights.

---

#### 👥 **2. Users and Groups Management**

In Windows PowerShell, local user and group management can be handled with:

- **`net user`** / **`net localgroup`** (legacy but works)
- Or newer: **`New-LocalUser`**, **`Add-LocalGroupMember`** (PowerShell 5+)

> 👤 Create a Local User

```powershell
$Password = Read-Host "Enter Password" -AsSecureString
New-LocalUser -Name "aziz" -Password $Password -FullName "Aziz Yahyaoui" -Description "DevOps guy"
```

> ❌ Remove a User

```powershell
Remove-LocalUser -Name "aziz"
```

> 👪 Create a Group

```powershell
New-LocalGroup -Name "devops" -Description "DevOps team group"
```

> ➕ Add a User to a Group

```powershell
Add-LocalGroupMember -Group "devops" -Member "aziz"
```

> ❌ Remove a Group or Member

```powershell
Remove-LocalGroupMember -Group "devops" -Member "aziz"
Remove-LocalGroup -Name "devops"
```

> 🔒 Set or Change Password

- 🔁 Change a User's Password:

```powershell
Set-LocalUser -Name "john" -Password (Read-Host -AsSecureString "New Password")
```

> 🧪 Check Membership:

```powershell
Get-LocalGroupMember -Group "Administrators"
```

## Scripting Essentials (.ps1)

### 📝 What is a Script File?

A **PowerShell script file** is a plain-text file containing a series of PowerShell commands, saved with the **`.ps1`** extension.

> 🧪 Think of `.ps1` like `.sh` in Linux, `.bat` in CMD, or `.py` in Python — it's an executable automation recipe.

---

> 📦 Why Use Scripts?

- ✅ Automate repetitive tasks
- ✅ Run commands in sequence
- ✅ Create custom tools for system management
- ✅ Schedule actions (via Task Scheduler, cron, CI/CD)
- ✅ Reuse and share across environments or teams

---

> ⚙️ Running a Script

To run a script, use:

```powershell
.\myscript.ps1
```

> 🛑 But first — check your **Execution Policy**:

```powershell
Get-ExecutionPolicy
```

If needed:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

> 🧠 How Scripts are Processed

When you execute a `.ps1` script:

1. PowerShell parses the code
2. Executes it **top-to-bottom**
3. Variables, functions, and outputs are handled line-by-line

---

> 🧱 Example Script: `hello.ps1`

```powershell
# hello.ps1
$name = "Aziz"
Write-Output "Hello, $name!"
```

Run it:

```powershell
.\hello.ps1
```

Output:

```text
Hello, Aziz!
```

---

> 🧠 Best Practices

| Tip                          | Explanation                                                      |
| ---------------------------- | ---------------------------------------------------------------- |
| Use `.ps1`                   | Not `.bat` or even `sh`. Always use `.ps1` for scripts.          |
| Add comments `#`             | Helps document what each line does.                              |
| Use full cmdlets             | Avoid aliases in scripts (use `Write-Output` instead of `echo`). |
| Use functions                | Organize code into reusable blocks (coming soon below).          |
| Test incrementally           | Run piece by piece to avoid surprises.                           |
| Store variables meaningfully | Use descriptive names like `$userList` instead of `$a`.          |

---

> 🔐 Scripting & Security

- `.ps1` files can be used maliciously.
- Avoid running untrusted scripts.
- Use `Get-Content` to inspect before executing.
- Keep scripts in secure locations.

---

### Basic script structure

A well-structured PowerShell script is not just functional — it's **readable**, **maintainable**, and **reusable**.

Let’s break down the common elements of a clean script:

---

#### 🔹 1. The Header (Documentation Block)

At the top of your script, always include a **header comment block** to describe its purpose:

 `<# ... #>` block in PowerShell is a special type of comment block called a **comment-based help** block. It's used to provide documentation and help information for a script, function, or module, and it's a powerful feature that makes your code more professional and easier for others (and your future self) to understand and use.

Think of it as the PowerShell equivalent of the `man` pages in Linux, but built directly into your script.

> What is it and how does it work?

The content inside the `<# ... #>` block isn't just a regular comment; it's structured data that PowerShell can read and interpret. When you run `Get-Help` on a function or script that has this block, PowerShell will parse the tags and display the information in a formatted, easy-to-read way.

> Key Tags within the Header

The comment-based help block uses specific tags, each starting with a dot (`.`), to provide different pieces of information. Here are some of the most common and important ones:

| Tag | Purpose | Example |
|---|---|---|
| `.SYNOPSIS` | A brief, one-line description of what the function or script does. | `.SYNOPSIS` \<br/\> `Gets the names of all services running on the local machine.` |
| `.DESCRIPTION` | A more detailed, multi-line explanation of the function's purpose, what it does, and why it's useful. | `.DESCRIPTION` \<br/\> `This function retrieves a list of all active Windows services. It can be used to monitor the status of services or to find specific services.` |
| `.EXAMPLE` | Provides one or more examples of how to use the function, including the command and a brief explanation of what the command does. | `.EXAMPLE` \<br/\> `PS C:\> Get-MyServices -Name "BITS"` \<br/\> `This command retrieves the service information for the Background Intelligent Transfer Service.` |
| `.PARAMETER <Name>` | Describes a specific parameter of the function. You need a separate `.PARAMETER` tag for each parameter. | `.PARAMETER Name` \<br/\> `Specifies the name of the service to retrieve. Wildcards are permitted.` |
| `.INPUTS` | Describes the type of objects that the function accepts as pipeline input. | `.INPUTS` \<br/\> `String` \<br/\> `This function accepts a string for the service name.` |
| `.OUTPUTS` | Describes the type of objects that the function outputs. | `.OUTPUTS` \<br/\> `System.ServiceProcess.ServiceController` \<br/\> `Returns an object representing the Windows service.` |
| `.NOTES` | Provides general, non-tagged information about the function, such as best practices or known issues. | `.NOTES` \<br/\> `This function requires administrator privileges to retrieve all service information.` |
| `.LINK` | Provides a link to related help topics or external documentation. | `.LINK` \<br/\> `https://docs.microsoft.com/en-us/powershell/` |

> A Simple Example

Here's what a complete comment-based help block might look like for a simple function:

```powershell
<#
.SYNOPSIS
    Creates a backup of a target folder.
.DESCRIPTION
    Compresses a target directory into a ZIP file and logs the action.
.AUTHOR
    Yahyaoui Med Aziz
.DATE
    2025-07-31
.VERSION
    1.0
#>
```
> Example 2:

```powershell
<#
.SYNOPSIS
    Gets a list of all services running on the system.

.DESCRIPTION
    This function is a simple wrapper for Get-Service that provides a more friendly output
    for a quick overview of running services.

.PARAMETER Name
    Specifies one or more service names to retrieve. Wildcards are supported.

.EXAMPLE
    PS C:\> Get-MyServiceList

    This command gets all services on the system.

.EXAMPLE
    PS C:\> Get-MyServiceList -Name "BITS"

    This command gets the service named 'BITS'.

.NOTES
    This function is for demonstration purposes. Use Get-Service for full functionality.

.LINK
    Get-Service
#>
function Get-MyServiceList {
    param(
        [string]$Name = "*"
    )

    Get-Service -Name $Name
}
```

> Why is this better than a simple comment?

1.  **Discoverability:** When you run `Get-Help Get-MyServiceList`, PowerShell formats all the information from the tags into a clean, structured output.
2.  **Consistency:** It encourages you to document your code in a standard way, making it easier for others to read and use your scripts.
3.  **Tooling Integration:** IDEs like Visual Studio Code can often parse these headers and provide IntelliSense or quick-help pop-ups as you're writing code.

So, in short, the `<# ... #>` header is a powerful and standard way to embed professional-grade documentation directly into your PowerShell scripts and functions. It's a great habit to get into as you start writing your own scripts\!



---

#### 🗣️ 2. Comments

Use `#` for single-line comments to explain logic and intentions:

```powershell
# Define source and destination paths
$source = "C:\Projects"
$destination = "D:\Backups"
```

#### 📦 3. Variables and data types

> You already explored **variables** earlier, but in scripting:

- Declare them early and meaningfully
- Reuse rather than hardcode
- You can also prompt for user input:

```powershell
$name = Read-Host "Enter your name"
Write-Output "Welcome, $name!"
```

Great timing to ask that! In PowerShell, you’ve already seen the common ones like `[string]`, `[int]`, `[bool]`, and `[datetime]`. But since PowerShell is built on top of **.NET**, it supports a wide variety of types — much richer than classic shell scripting.

Here’s a categorized breakdown of **commonly used data types** in PowerShell:

---

##### 🧬 PowerShell Data Types

> 🔤 **Text & Characters**

| Type       | Example           |
| ---------- | ----------------- |
| `[string]` | `"Aziz Yahyaoui"` |
| `[char]`   | `'A'`             |

---

> 🔢 **Numbers**

| Type                | Example                                          |
| ------------------- | ------------------------------------------------ |
| `[int]` / `[int32]` | `42`                                             |
| `[int64]`           | `12345678901234`                                 |
| `[double]`          | `3.14`                                           |
| `[decimal]`         | `[decimal]19.99` (for high-precision money/math) |
| `[float]`           | `[float]3.14`                                    |

💡 PowerShell automatically chooses based on context unless you cast explicitly.

---

> 🔘 **Booleans**

| Type     | Example           |
| -------- | ----------------- |
| `[bool]` | `$true`, `$false` |

---

> ⌚ **Date & Time**

| Type         | Example                       |
| ------------ | ----------------------------- |
| `[datetime]` | `[datetime]"2025-07-31"`      |
| `[timespan]` | `[timespan]::FromMinutes(90)` |

> You can do math with them like:
> `$deadline = (Get-Date).AddDays(7)`

---

> 📦 **Collections & Tables**

| Type             | Example                                            |
| ---------------- | -------------------------------------------------- |
| `[array]`        | `@(1, 2, 3)`                                       |
| `[hashtable]`    | `@{Name="Aziz"; Age=25}`                           |
| `[list[string]]` | `[System.Collections.Generic.List[string]]::new()` |

---

> 🧪 **Object & Reflection**

| Type         | Description                                           |
| ------------ | ----------------------------------------------------- |
| `[object]`   | The universal base type (everything inherits from it) |
| `[psobject]` | A PowerShell-specific wrapper type used in pipelines  |
| `[null]`     | A special non-value                                   |

---

> 🌐 **Web & Data Formats**

| Type      | Used For                                       |
| --------- | ---------------------------------------------- |
| `[xml]`   | XML parsing (`[xml]$x = Get-Content file.xml`) |
| `[json]`  | Via `ConvertFrom-Json` / `ConvertTo-Json`      |
| `[regex]` | Regular expressions                            |

---

> 🧠 **Specialized / System Types**

| Type            | Description                                        |
| --------------- | -------------------------------------------------- |
| `[guid]`        | Globally Unique Identifier: `[guid]::NewGuid()`    |
| `[uri]`         | Uniform Resource Identifier                        |
| `[scriptblock]` | Code as data (like function blocks)                |
| `[switch]`      | Special boolean-style input (`-Verbose`, `-Force`) |
| `[enum]`        | Enum values from .NET or your custom ones          |

---

> ✅ How to Check the Type of Any Variable

```powershell
$myVar = Get-Date
$myVar.GetType()
```

Or this for detailed properties and methods:

```powershell
$myVar | Get-Member
```

---

#### 🔄 4. Input, Output & Logging

> Use `Write-Output`, `Write-Host`, or `Out-File` depending on purpose:

```powershell
Write-Host "Running backup..." -ForegroundColor Cyan
"[$(Get-Date)] Backup started." | Out-File -FilePath log.txt -Append
```

> To ask user for input, use `Read-Host`:

```powershell
$name = Read-Host "Enter your name"
Write-Output "Welcome, $name!"
```

> For logging, prefer `Out-File` or `Add-Content` to write to files:

```powershell
"[$(Get-Date)] Backup completed." | Add-Content -Path log.txt
```

---

#### 🔁 5. Control Flow (if, else, loops)

Scripting without logic is like a game without rules — here’s how to direct flow:

✅ **Conditional Statements**

```powershell
if ($name -eq "Aziz") {
    Write-Output "Admin recognized."
} else {
    Write-Output "Guest access only."
}
```

✅ **Loops**

```powershell
# For loop
for ($i = 1; $i -le 5; $i++) {
    Write-Output "Iteration $i"
}

# Foreach loop
$services = Get-Service | Where-Object {$_.Status -eq "Running"}
foreach ($svc in $services) {
    Write-Output "$($svc.Name) is running"
}
```

✅ **While loop**

```powershell
$count = 0
while ($count -lt 3) {
    Write-Output "Try number: $count"
    $count++
}
```

---


### functions

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

> ⚠️ **Avoid aliases in scripts!**
>
> While `echo`, `ls`, and `pwd` are handy for quick typing, always use the full cmdlets (`Write-Output`, `Get-ChildItem`, `Get-Location`) in scripts to ensure clarity, portability, and maintainability.

---

## Extra Practical Examples

> Getting System Information

```powershell
# Get basic computer information
Get-ComputerInfo

# Get operating system information
Get-CimInstance -ClassName Win32_OperatingSystem

# Get network adapter information
Get-NetAdapter
```

> Managing Processes

```powershell
# Get all running processes
Get-Process

# Get a specific process by name
Get-Process -Name "notepad"

# Stop a process (use -Force with caution)
# Stop-Process -Name "notepad" -Force

# Start a new process
# Start-Process -FilePath "notepad.exe"
```

> Working with Files and Directories

```powershell
# List files and directories in the current location
Get-ChildItem

# Create a new directory
New-Item -Path "C:\Temp\MyNewFolder" -ItemType Directory

# Create a new file
New-Item -Path "C:\Temp\MyNewFolder\MyFile.txt" -ItemType File

# Write content to a file
 "Hello, PowerShell!" | Out-File -FilePath "C:\Temp\MyNewFolder\MyFile.txt"

# Append content to a file
"\nThis is a new line." | Add-Content -Path "C:\Temp\MyNewFolder\MyFile.txt"

# Read content from a file
Get-Content -Path "C:\Temp\MyNewFolder\MyFile.txt"

# Copy a file
Copy-Item -Path "C:\Temp\MyNewFolder\MyFile.txt" -Destination "C:\Temp\MyNewFolder\MyFile_copy.txt"

# Move a file
Move-Item -Path "C:\Temp\MyNewFolder\MyFile.txt" -Destination "C:\Temp\MyNewFolder\MovedFile.txt"

# Remove a file
Remove-Item -Path "C:\Temp\MyNewFolder\MyFile_copy.txt"

# Remove a directory (use -Recurse and -Force with caution)
Remove-Item -Path "C:\Temp\MyNewFolder" -Recurse -Force
```

---
