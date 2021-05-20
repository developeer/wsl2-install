# Script requires Powershell Administrator Console
# Must be run with Powershell 5 not Powershell Core
# Script will install virtual machine platform, wsl and reboots
# install-01.ps1

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -all -norestart

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -all -norestart

Restart-Computer