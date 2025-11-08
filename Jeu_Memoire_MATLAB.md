# Jeu de Mémoire MATLAB

Un jeu de mémoire classique développé sous **MATLAB** avec une interface graphique **GUIDE**. Le joueur doit retrouver toutes les paires de cartes identiques le plus rapidement possible.

---

## Fonctionnalités

- 16 cartes (nombres de 1 à 8, deux fois chaque nombre)
- Mélange aléatoire des cartes à chaque partie
- Interface graphique avec 16 boutons cliquables
- Chronomètre intégré pour mesurer le temps de jeu
- Message de victoire affichant le temps total

---

## Instructions

1. Ouvrir MATLAB.
2. Charger le fichier `memoire.m`.
3. Exécuter le script `memoire` pour lancer le jeu.
4. Cliquer sur les cartes pour révéler les paires.
5. Terminer le jeu pour voir votre temps total.

---

## Structure du code

- `memoire.m` : script principal
- Fonctions clés :
  - `memoire_Ouverture` : initialise le jeu et mélange les cartes
  - `maj_boutons` : met à jour l'affichage des cartes
  - `clic_carte` : gère les clics et la logique des paires
  - `pushbuttonX_Callback` : callbacks pour chaque bouton (16 au total)

---

## Contribution

Les contributions sont les bienvenues !  
1. Fork le dépôt.
2. Crée une branche (`git checkout -b feature/ma-fonctionnalite`).
3. Commit tes modifications (`git commit -m 'Ajouter une fonctionnalité'`).
4. Push vers la branche (`git push origin feature/ma-fonctionnalite`).
5. Ouvre une Pull Request.

---

## Présentation du Jeu

Voici une démonstration du jeu :  
[La vidéo de démonstration du jeu](https://drive.google.com/file/d/1eFZx2aTYanMBaBVXU6P2yKtfRupCEXMI/view?usp=sharing)

