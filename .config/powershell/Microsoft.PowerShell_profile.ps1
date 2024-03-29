# DYLAN'S POWERSHELL PROFILE
# like .bash_profile but for Windows PowerShell
#
# store file in:
# Windows - $Home\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
# Linux - ~/.config/powershell/Microsoft.Powershell_profile.ps1
# macOS - ~/.config/powershell/Microsoft.Powershell_profile.ps1
#
# after saving changes, do `.$profile` in powershell to reload
################################################################################


# PATH
################################################################################
# $env:Path += ";$env:userprofile\AppData\Local\Programs"


# ALIASES
################################################################################

# update git repo and then open in vscode
function workspace {
  git fetch;
  git status;
  code .
}

# quickly edit this config file
function config {
  code $profile
}

# hard reset git repository to latest online version
function overwrite {
  git fetch --all;
  git reset --hard origin/main;
  git reset --hard origin/master;

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

# open emacs in terminal by default
# source: https://superuser.com/questions/339105/how-do-i-launch-emacs-in-terminal-mode-within-powershell
$emacs_wildcard = "C:\ProgramData\chocolatey\bin\emacs.EXE"
if ($(Test-Path $emacs_wildcard)) {
  $emacs_path = (Get-ChildItem $emacs_wildcard)[-1].FullName -replace ' ', '` '
  function emacs { "$emacs_path -nw $args" | Invoke-Expression }
}

# Define dotfiles function
function dotfiles {
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $args
}

function open { explorer.exe . }
function home { set-location "H:\" }
function documents { set-location "H:\Documents\" }
function docs { set-location "H:\Documents\" }
function downloads { set-location "C:\Users\Dylan\Downloads\" }
function documents { set-location "H:\Documents\" ; explorer.exe . }
function projects { set-location "H:\Projects\" ; explorer.exe . }
function docs { set-location "H:\Documents\" }
function downloads { set-location "C:\Users\Dylan\Downloads\" }
function sites { set-location "H:\Sites\" ; explorer.exe . }
function blog { set-location "H:\Sites\nocategories" ; explorer.exe .; workspace }
function notes { set-location "H:\Notes\" ; code . }
function valestyles { set-location "$env:userprofile\.config\vale"; workspace }
function artsite { set-location "H:\Sites\art\" ; explorer.exe .; workspace }
function weather { curl wttr.in }
function artsite { set-location "H:\Sites\art\" ; explorer.exe .; workspace }

## Moving around
function root { set-location / }
function up { set-location ../ }
function up2 { set-location ../.. }
function up3 { set-location ../../.. }
function up4 { set-location ../../../.. }
function up5 { set-location ../../../../.. }
function up6 { set-location ../../../../../.. }
function up7 { set-location ../../../../../../.. }
function up8 { set-location ../../../../../../../.. }
function up9 { set-location ../../../../../../../../.. }
function up10 { set-location ../../../../../../../../../.. }

# # New-Alias which get-command
Remove-Item alias:\where -Force
New-Alias where get-command -Force


# INIT
################################################################################

# Starship Prompt
# https://starship.rs/
# https://starship.rs/config/#prompt
# ------------------------------------------------------------------------------
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CACHE = "C:\Temp"


# Chocolatey profile
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }
