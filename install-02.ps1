# Download and Install Linux Kernel Update and Ubuntu 20.04 Distro

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
}

Remove-Item -Path ".\wsl-ubuntu-2004.appx" -Force

wsl --list --verbose

& "ubuntu2004.exe"

# At this point, you will be in Ubuntu 20.04 bash and will be prompted for username and password. Type exit to return to powershell