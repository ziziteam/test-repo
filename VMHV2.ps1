Clear-Host
Write-Host "Génération automatique de VMs dans Hyper V"
#Teste de la présence du module Hyper V
if (Get-Module -ListAvailable -Name Hyper-V) {
    Write-Host "Module Hyper-V détecté" -ForegroundColor Green
}
else {
    Write-Host "Installation du module Hyper-V" -ForegroundColor Red
    Import-Module Hyper-V
}
# Les machines sont elles des serveurs
[string]$ParentPath = "F:\VHD\MASTER-W10.vhdx"
[bool]$IsServer = $false

$Reponse = Read-Host -Prompt ("Les VMs seront elles des clients (C) ou des Serveurs (S) ?")

if ($Reponse -eq 'S'){
    Write-Host "choix : serveur"
    $ParentPath = "F:\VHD\MASTER-SRV.vhdx"
    $IsServer = $true
}
elseif ($Reponse -eq 'C'){
    Write-Host "choix : client"
    $ParentPath = "F:\VHD\MASTER-W10.vhdx"
    $IsServer = $false
}
else {
    Write-Host "Valeur incorrecte, choix par défaut : client"
}

# Nom des VMs
$VMName = Read-Host -Prompt ("Entrez le nom des machines" )

# Nombre de VMs à créer
$NbreVMs = Read-Host -Prompt ("Nombre de VMs à créer")

#Nombre de processeurs
$NBCpu = Read-Host -Prompt ("Nombre de proceseurs")

# RAM
$RAM = Read-Host -Prompt ("Quantité de RAM à allouer (GB)")

#################################################
# Test VHDX
 
do {
    Write-Host ("Chemin du disque parent introuvable") -ForegroundColor Red
    $ParentPath = Read-Host -Prompt ("Chemin d'accès du disque parent")
}
while  (Get-VHD -Path $ParentPath -ErrorAction SilentlyContinue -eq $null)