# Document Explicatif du Projet Linux MoSEF 2018 par Joel STERN, joelst91

**Ce Document "readme.md" vous explique chaque étape énumérée dans "consignes.md" à l'aide de descritpions, de cas test et de code**

## Etape préalable

Veillez à ce que  git soit préalablement bien configuré à l'aide de ce [Lien](https://help.github.com/articles/set-up-git/)

## Etape 1 : *Forker* le dépot dans votre compte github

Pour forker le dépot sur notre compte github,

- Se conncecter sur son compte github, puis aller sur le lien du dépot:
  https://github.com/ambalde/MoSEF-projet-2018
- Cliquer sur le bouton "fork" situé dans le coin supérieur droit  de la page.

Le lien apprait désormais dans la liste de forks du projet avec votre pseudonyme git.
Plus d'informations, sur ce [Lien](https://help.github.com/articles/fork-a-repo/)

## Etape 2 : *Cloner* votre copie en local

Pour cloner une copie de notre dépôt forké en local, il suffit de taper l'instruction suivante dans le terminal :

```
git clone https://github.com/joelst91/MoSEF-projet-2018.git
```

Plus d'information sur ce [Lien](https://help.github.com/articles/set-up-git/)

## Etape 3 : Créer le script fich-semaine-derniere.sh

Pour créer le fichier script au format bash, il faut taper l'instruction suivante dans le terminal, dans notre répertoire
MoSEF-projet-2018

```
vim fich_semaine_derniere.sh
```

Le fichier contient les lignes de codes suivantes:

```cd ~
echo "Script executé le  $(date +%d) $(date +%B) $(date +%Y) à $(date +%H) heures $(date +%M) minutes $(date +%S) secondes"
read -p "Bonjour qui est-ce ? " user
echo "Bienvenue $USERNAME alias  $user, nous sommes le $(date +%d) $(date +%B) $(date +%Y)"
read -p "Quel contenu de repértoire souhaitez vous afficher ? Veuillez indiquer son chemin à partir de /home/sorbonne/ " rep
cd /home/sorbonne/$rep
ls
```
Pour executer le scipt on utilise l'instruction

```
bash fich_semaine_derniere.sh
```
- Pour afficher la date et  le moment d'execution du script, on utilise la variable date avec les "options":
jour, mois, année, heure, minute, seconde.
- La variable d'environnement username est utilisée, étant associé à 'sorbonne', le script demande le nom de la personne.
- Ensuite le script demande de taper le chemin du repertoire souhaité à la suite de /home/sorbonne, il suffit donc de taper le nom du ou des repertoires ou sous-répertoires directement, par exemple Bureau, Documents ou bien repos/MoSEF-projet-2018 etc...
- La liste du contenu du chemin du repertoire apparaît.

## Etape 4 : Commiter le fichier dans votre dépot local puis pousser les modifications dans le dépot distant

On se place dans notre repo git local, on place le fichier script dans la zone de transit avec git add
on commit l'ajout réalisé, puis on ajoute le lien distant et on pousse les modifications dessus en entrant notre ID et MdP
```git add fich_semaine_derniere.sh
git commit -m "Ajout du script fich_semaine_derniere.sh"
git remote add origin https://github.com/joelst91/MoSEF-projet-2018.git
git push -u origin master
```

## Etape 5 : Sur le dépot local, créer une nouvelle branche

Pour créer une nouvelle branche en locale on écrit l'instruction suivante dans le terminal:

```
git branch newbranch
```
## Etape 6 : Editer le script dans la nouvelle branche pour qu'il affiche tous les fichiers modifiés il y a moins d'une semaine

On édite le scripte dans la nouvelle branche en y ajoutant:

```
read -p "Indiquez le chemin du répertoire qui suit /home/sorbonne/ pour afficher les fichier modifiés la semaine dernière " rep7
cd /home/sorbonne/$rep7
findrep7=$(find -type f -mtime -7)
echo"$findrep7"
```
La commande find -type f -mtime -7 avec ces options permet de trouver les fichiers modifiés il y a moins d'une semaine,
dans le repertoire où l'on se situe.

## Etape 7 : Pousser les changements dans votre dépot distant

on se positionne sur la branche "newbranch" en tapant:

```git branch newbranch
git add fich_semaine_derniere.sh
git commit -m "Edition du script dans newbranch"
git remote add origin https://github.com/joelst91/MoSEF-projet-2018.git
git push -u origin newbranch
```

## Etape 8 : Faire une *pull request* de la nouvelle branche sur master. Fusionner la pull request 

Sur github, se placer sur master, sur https://github.com/joelst91/MoSEF-projet-2018,
Cliquer sur "new pull request"
on se place sur la base fork joelst91/MoSEF-projet-2018, on compare les branches "Master" à "newbranch",
on clique sur "create pull request", puis sur "merge", et sur "confirm merge"

## Etape 9 : En local, *fusionner* la nouvelle branche à master.

on se place sur la branche master, puis on "merge" master avec newbranch.

```
git checkout master
git merge newbranch
```

## Etape 10 : Supprimez Consignes.md en local et pousser les modifications sur github

on supprime en local avec rm puis on pousse sur le repo distant après avoir commité la suppression

```
rm Consignes.md
git add Consignes.md
git commit -m "Suppression du fichier Consignes.md"
git push -u origin master
```

On veille a bien pousser les modifications des deux dernieres étapes en tapant:
```
git push 
git pull
```
Et en vérifiant si les dépots local et distant sont à jour avec:
```
git status
```
Fin du Readme

