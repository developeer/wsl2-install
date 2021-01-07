
# Create copy of existing Ubuntu 20.04 Instance

wsl --list --verbose

# export existing instance
wsl --export Ubuntu-20.04 ubuntu-2004.tar

New Item -ItemType Directory -Force -Path c:\apps\wsl\UbuntuGo2004

wsl --import UbuntuGo2004 c:\apps\wsl\UbuntuGo2004 ubuntu-2004.tar

Remove-Item -Path .\ubuntu-2004.tar -Force

wsl --list --verbose

# change [username]
wsl -d UbuntuGo2004 --user [username]

<#

  # stop the instance
  wsl --terminate UbuntuGo2004

  # remove the instance 
  wsl --unregister UbuntuGo2004


#>