Clear-Host
Write-Host "G�n�ration automatique de VMs dans Hyper V"
#Teste de la pr�sence du module Hyper V
if (Get-Module -ListAvailable -Name Hyper-V) {
    Write-Host "Module Hyper-V d�tect�" -ForegroundColor Green
}
else {
    Write-Host "Installation du module Hyper-V" -ForegroundColor Red
    Import-Module Hyper-V
}
coucou

branch test