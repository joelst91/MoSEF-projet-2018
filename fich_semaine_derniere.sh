#!/bin/bash

cd ~

echo "Script executé le  $(date +%d) $(date +%B) $(date +%Y) à $(date +%H) heures $(date +%M) minutes $(date +%S) secondes"

read -p "Bonjour qui est-ce ? " user
echo "Bienvenue $USERNAME alias  $user, nous sommes le $(date +%d) $(date +%B) $(date +%Y)"

read -p "Veuillez indiquer le chemin du repertoire souhaité, à partir de /home/sorbonne/ pour afficher son contenu. " rep
cd /home/sorbonne/$rep
ls

read -p "Indiquez le chemin du répertoire qui suit /home/sorbonne/ pour afficher les fichier modifiés la semaine dernière " rep7

cd /home/sorbonne/$rep7

findrep7=$(find -type f -mtime -7)
