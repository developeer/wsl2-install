# Enable and Install WSL2 on Windows 10

  Requirement of Windows 10 1909 or above

## Step 1 Enable 

  * Enable Features in Windows 10
  * Requires Administrative Powershell Console
  * This script will automatically reboot your computer.

```
.\install-01.ps1
```
Contents
```
# Script requires Powershell Administrator Console
# Script will install virtual machine platform, wsl and reboots
# install-01.ps1

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -all -norestart

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -all -norestart

Restart-Computer

```


## Step 2 Install Ubuntu 20.04 Distribution

  Does not require Windows Administrative Powershell Console

```
.\install-02.ps1
```

Contents
```
# Download and Install Linux Kernel Update and Ubuntu 20.04 Distro
# install-02.ps1

Write-Host "Downloading Linux Kernel Update"
Invoke-Request -Uri "" -OutFile "wsl_update_x64.msi" -UseBasicParsing

Write-Host "Installing Linux Kernel Update"
& "msiexec" /i .\wsl_update_x64.msi /qn

Write-Host "Deleting Linux Kernel Update msi"
Remote-Item -Path .\wsl_update_x64.msi -Force

Write-Host "Set wsl default version to 2"
wsl --set-default-version 2

$Filename = "wsl-ubuntu-2004.appx"
Write-Host "Downloading : $Filename" -Foreground Yellow --NoNewLine

try {

    #
    #

    Invoke-WebRequest -Uri "https://aka.ms/wslubuntu2004" -OutFile $Filename -UseBasicParsing
    Add-AppxPackage -Path $Filename

    if ($?) {
        Write-Host " Done" -Foreground Gree
    }

} catch {
    Write-Host " Failed" -Foreground Red
    Exit 1
}

Remove-Item -Path ".\wsl-ubuntu-2004.appx" -Force

wsl --list --verbose

& "ubuntu2004.exe"

# At this point, you will be in Ubuntu 20.04 bash and will be prompted for username and password. Type exit to return to powershell

```

## Create multiple instances of Ubuntu existing distribution

  * Example script to copy and existing distribution to create a new one.
  * Modify script as necessary for folde locations.

```
.\copy-instance.ps1
```
Contents

```


# Create copy of existing Ubuntu 20.04 Instance
# copy-instance.ps1

wsl --list --verbose

# export existing instance
wsl --export Ubuntu-20.04 ubuntu-2004.tar

#create destination folder
New-Item -ItemType Directory -Force -Path C:\wsl\Ubuntu-20.04-2

#registers the instance in Windows Terminal
wsl --import Ubuntu-20.04-2 C:\wsl\Ubuntu-20.04-2\ ubuntu-2004.tar

#remove the backup file
Remove-Item -Path .\ubuntu-2004.tar -Force

wsl --list --verbose

# change [username]
wsl -d Ubuntu-20.04-2 --user [username]

<#

  # stop the instance
  wsl --terminate UbuntuGo2004

  # remove the instance - unregisters the instance from Windows Terminal 
  wsl --unregister UbuntuGo2004


#>
```

## Powershell Core 7.1.0

  Install latest version of Powershell Core

  * https://github.com/PowerShell/PowerShell/releases/tag/v7.1.0

## Windows Terminal 

Install Windows Terminal through Windows Store.

  * https://github.com/Microsoft/Terminal
  * https://aka.ms/terminal




