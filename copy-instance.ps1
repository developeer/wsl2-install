
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