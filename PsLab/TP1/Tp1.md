# 🧪 TP1 – PowerShell CLI Hands-on Practice

> 🎯 **Objective:**  
Get familiar with basic PowerShell cmdlets that map to common Linux commands. This exercise will guide you through everyday tasks using **full cmdlets** (not aliases) to help build clean scripting habits.

---


## 🚀 Tasks

### 1. 📍 Get Your Bearings

* Display your current location:

  ```powershell
  Get-Location // gl
  ```

* Navigate to your home directory using:

  ```powershell
  Set-Location -Path $HOME  // sl
  ```

* Return to the TP1 working directory:

  ```powershell
  Set-Location -Path "$HOME\TP1_PS_CLI"
  ```

---

### 2. 📁 Directory & File Management

* Create a directory named `Logs` and a file named `note.txt`, `file1`, `dir1`:

  ```powershell
  New-Item -ItemType Directory -Path "Logs"
  New-Item -ItemType File -Path "note.txt"
  ```

* Copy `note.txt` to the `Logs` folder:

  ```powershell
  Copy-Item -Path "note.txt" -Destination "Logs\note_backup.txt"
  ```
  > Copy-Item : cpi, cp, copy

* Move `file` to `logs`:

  ```powershell
  Move-Item -Path "file" -Destination "logs"
  ```
  > Move-Item: mi, mv, move

* Rename `file` to `note-renamed.txt`:

  ```powershell
  Move-Item -Path "note.txt" -Destination "note-renamed.txt"
  ```

* Delete the renamed file:

  ```powershell
  Remove-Item -Path "note-renamed.txt"
  ```
  > Remove-Item: ri,rm, rmdir, del, erase, rd
---

### 3. 📖 Read & Output

* Add some text to the backup note:

  ```powershell
  Add-Content -Path "Logs\note_backup.txt" -Value "Hello from PowerShell!"
  ```
  > Add-Content: ac

* Read the contents of the file:

  ```powershell
  Get-Content -Path "Logs\note_backup.txt"
  ```
  > Get-Content: cat, gc, type

* Output a message to the console (using full cmdlet):

  ```powershell
  Write-Output "Mission accomplished."
  ```
  > Write-Output:  Write, echo
---

### 4. 🧼 Clean Up

* Clear the PowerShell console:

  ```powershell
  Clear-Host
  ```

* Remove everything you created:

  ```powershell
  Remove-Item -Recurse -Force "$HOME\TP1_PS_CLI"
  ```

---

## 🧠 Bonus

Try to complete all the tasks again using only the **aliases** (like `ls`, `cd`, `rm`, `echo`, etc.). Then reflect:

> 🤔 Which approach feels clearer and more sustainable for scripting?

---

## ✅ What You Learned

* How to **navigate**, **create**, **manipulate**, and **remove** files and folders using PowerShell.
* Why **full cmdlets** improve readability and portability.
* How PowerShell matches your Linux knowledge, but returns **objects**, not just text.

> 💬 *Optional challenge:* Script this entire flow in a `.ps1` file and run it automatically. You’re scripting now, buddy!

