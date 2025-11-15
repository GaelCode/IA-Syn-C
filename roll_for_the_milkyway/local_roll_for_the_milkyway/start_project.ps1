# --- Ce script doit être placé dans le dossier 'local_roll_for_the_milkyway' ---

# $PSScriptRoot est une variable magique qui contient le dossier de ce script
$ProjectRoot = $PSScriptRoot

# Définir les chemins clés
$HtmlDir = Join-Path $ProjectRoot "html"
$PythonScript = Join-Path $ProjectRoot "roll_for_the_milkyway.py"
$Arg1 = Join-Path $ProjectRoot "..\ia-gael.sync" # Argument 1 (remonte d'un niveau)
$Arg2 = Join-Path $ProjectRoot "localIAs\iaBuzzLeclair.sync" # Argument 2
$Arg3 = Join-Path $ProjectRoot "localIAs\iaJackOneillSeed287.sync" # Argument 2
$Arg4 = Join-Path $ProjectRoot "localIAs\iaThanosSeed1324.sync" # Argument 2

Write-Host "===================================================" -ForegroundColor Green
Write-Host "  Lancement du script Python..."
Write-Host "===================================================" -ForegroundColor Green

# Se placer dans le répertoire du script Python
Set-Location $ProjectRoot

# Exécuter le script Python
& python3 $PythonScript $Arg1 $Arg2 $Arg3 $Arg4

Write-Host ""
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "  Lancement du serveur PHP (localhost:8888)"
Write-Host "  Racine du serveur : $HtmlDir"
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Le terminal est maintenant bloque par le serveur PHP." -ForegroundColor Yellow
Write-Host "  APPUYEZ SUR CTRL+C POUR ARRETER LE SERVEUR." -ForegroundColor Yellow
Write-Host ""

# Lancer le serveur PHP en lui indiquant le dossier HTML avec l'option -t
# Le script RESTE dans $ProjectRoot
php -S localhost:8888 -t $HtmlDir