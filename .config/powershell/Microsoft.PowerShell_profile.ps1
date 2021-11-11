# DYLAN'S POWERSHELL PROFILE
# like .bash_profile but for Windows PowerShell
# store file in:
# %USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# Windows - $Home\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# Linux - ~/.config/powershell/Microsoft.Powershell_profile.ps1
# macOS - ~/.config/powershell/Microsoft.Powershell_profile.ps1
###############################################################################


# PATH
################################################################################
# $env:Path += ";$env:userprofile\AppData\Local\Programs"   


# FUNCTIONS 
################################################################################

# update git repo and then open in vscode
function workspace {
  git fetch; 
  git status;
  code . 
}

# quickly edit this config file
function config {
  code $env:userprofile\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
}

# hard reset git repository to latest online version
function overwrite {
  git fetch;
  git reset --hard origin/master
}

# delete empty directories recursively
function noempty {
  Get-ChildItem -Force -Recurse -Directory | ? { -Not ($_.EnumerateFiles('*', 1) | Select-Object -First 1) } | Remove-Item -Recurse
}

# flatten subdirectories. all files are move up into the current dir
function flatten {
  $targetDir = Convert-Path '.' # Get the current directory's path.
  Get-ChildItem -Path $targetDir -Filter * -Recurse -File |
  Move-Item -Destination $targetDir -force
  noempty
}

# ALIASES
################################################################################

function open { explorer.exe . }
function home { set-location "H:\" }
function sites { set-location "H:\Sites\" ; explorer.exe . }
function valestyles { set-location "$env:userprofile\.config\vale"; workspace }

## Moving around
function root { cd / }
function up { cd ../ }
function up2 { cd ../.. }
function up3 { cd ../../.. }
function up4 { cd ../../../.. }
function up5 { cd ../../../../.. }
function up6 { cd ../../../../../.. }
function up7 { cd ../../../../../../.. }
function up8 { cd ../../../../../../../.. }
function up9 { cd ../../../../../../../../.. }
function up10 { cd ../../../../../../../../../.. }

New-Alias which get-command
Remove-Item alias:\where -Force
New-Alias where get-command -Force
 

# INIT
################################################################################

# Set the startup directory
# annoyingly this breaks some scripts and breaks "open directory in terminal"
# set-location "H:\"

# Powerline
# ------------------------------------------------------------------------------

# Install with:
#   Install-Module posh-git -Scope CurrentUser
#   Install-Module oh-my-posh -Scope CurrentUser
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme powerline

# Chocolatey profile
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }
