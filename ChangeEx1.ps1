#demander a lutilisateur le chemin de repertoir 

$chemin = Read-Host "entrer le chemin de repertoir "

#verifier si le chemin existe 
if (Test-Path $chemin -PathType Container) {
    #demander a l'utilisateur l'extension a remplacer
    $ancienneExtension = Read-Host "entrer l'ancien extention"

    #demander lanouvelle extension 
    $nouvelleExtension = Read-Host "donner moi la nouvele extension"

    #changer l'extension des fichier dans le repertoir

    Get-ChildItem -path $chemin -File | ForEach-Object {
        $nouveauNom = $_.BaseName + $nouvelleExtension
        Rename-Item -path $_.FullName -NewName $nouveauNom -Force

        Write-Host "le fichier $($_.Name) a ete renome en $nouveauNom"


    }
    Write-Host "changement d'extension termine"
}