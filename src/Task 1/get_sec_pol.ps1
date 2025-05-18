# Проверка запуска от имени администратора
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as administrator."
    exit
}

# Экспорт локальных политик безопасности в файл secpol.txt
secedit /export /cfg "$PSScriptRoot\secpol.txt"

Write-Host "Security policies exported to secpol.txt"
