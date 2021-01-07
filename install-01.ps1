# Script requires Powershell Administrator Console
# Script will install virtual machine platform, wsl and reboots

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -all -norestart

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -all -norestart

Restart-Computer