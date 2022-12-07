# Qu'est que VGDB ?
**VGDB** est une solution au projet "Jeux" de SGBD proposé aux élèves de la promotion 2021-2024 Informatique de [l'ENSEIRB-Matméca](https://enseirb-matmeca.bordeaux-inp.fr/fr/informatique). 

Celle-ci propose une implémentation d'une base de donnée d'une communauté de joueurs de jeux de société/jeux de rôle manipulée à l'aide d'une application Web se voulant proche du fonctionnement d'un "forum".
# Démarrage rapide
## Pré-requis
L'interface et la base de données étant contenerisés, il est nécessaire d'avoir la dernière version de `Docker`. Pour cela, on recommande de suivre la documentation officielle sur [l'installation de Docker Engine](https://docs.docker.com/engine/install/). L'application nécessite aussi les accès administrateurs (`sudo`) pour déployer les conteneurs.

## Lancement
L'installation de l'application se fait simplement via le script :
```sh
./install.sh
```
Il faudra alors préciser :
- le mot de passe administrateur `ROOT` de la base de donnée
- un utilisateur `USER`et son mot de passe `USER_PASSWD` pour la base de donnée

Attention : l'installation peut-être un peu longue la première fois le temps de de télécharger et construire les trois containers.

L'application est alors accessible via http://localhost:5000

## Environnement de développement
Ce dépôt propose aussi aux développeurs un script permettant de démarrer uniquement le conteneur MariaDB ainsi que l'interface de gestion [**Adminer**](https://www.adminer.org). 

### Démarrage de l'environnement de développement
1. Lancer le script de lancement 
```sh
./devrun.sh
```
2. Démarrer l'API dans un terminal avec
```sh
cd source/backend && npm i && npm run dev
```
3. Démarrer l'interface utilisateur dans autre un terminal avec
```sh
cd source/frontend && npm i && npm run serve
```

### Accès :
- Frontend : http://localhost:5000
- Backend : http://localhost:3000
- Adminer : http://localhost:8080

Les identifiants de la base de donnée sont répertoriés dans `.env_local` et ensuite copiés dans `.env` lors de l'exécution de `./devrun.sh`.

# Fonctionnement détaillé
## Architecture de VGDB
L'application est décomposée en trois parties : base de donnée, API ("backend") et interface utilisateur ("frontend"). L'application complète (backend + frontend) sont entièrement développés en TypeScript à l'aide de différents frameworks disponibles dans le gestionnaire de paquets `npm`.

### Base de donnée
La base de donéne en elle-même est hébergée par un serveur **MariaDB** avec le moteur de stockage **InnoDB**. Le conteneur peut recueillir ses requêtes directement via le port `3306` mais aussi via [**Adminer**](https://www.adminer.org/), une interface simplifiée de manipulation de base de donnée.

L'ensemble des requêtes utilisés par l'application sont regroupées dans le dossier `sql` et réparties en plusieurs fichiers :
```
sql
├── create.sql // Création de la base de donnée et des 
│                 tables
├── drop.sql   // Suppression de la base de données
├── insert.sql // Insertion de données de test
├── select.sql // Requêtes de sélections
├── triggers.sql    // Déclencheurs 
└── vues.sql // Vues
```
La création et l'initialisation de la base se fait dans les scripts d'installation `./install.sh` et `./devrun.sh` par le chargement des fichiers `create.sh`, `insert.sql`, `vues.sql` et `triggers.sql` depuis `docker`. `select.sql` ne sert quand à lui qu'à répertorier les requêtes utilisés par l'API de VGDB.

### API "backend"
L'interaction de la base de donnée est implémentée par un gestionnaire de requête REST programmée avec le framework [**ExpressJS**](https://expressjs.com/).

L'API reçoit ses requêtes REST sur http://localhost:3000 et envoie directement une requête SQL contenue dans chaque route à la base de donnée via le connecteur `mariadb.connector.ts`.

Les sources de cette partie "backend" de l'application se trouvent dans `source/bakend` et se répartissent ainsi :
```
source
└── backend
    ├── app.ts // Fichier principale, entrée du backend
    ├── config // Configuration du backend et de     
    │             la base de donnée
    ├── models // Ensemble des fonctions permettant  
    │             d'exécuter des requêtes
    ├── routes // Routes exécutant les fonctions de   
    │             models
    ├── utils  // Contient le connecteur sur la BDD
    │   └── mariadb.connector.ts
    └── package.json // Ensemble des dépendances du 
                        backend 
```

### Interface utilisateur
L'interface utilisateur est quand à elle conçue via le framework [**VueJS 3**](https://vuejs.org), avec le thème CSS [**Bulma**](https://bulma.io). 

L'application est conçue en une seule page comportant différentes vues sur les jeux, les commentaires, les joueurs. L'appel aux requêtes RESTa été voulu comme étant le plus natuel possible en implémentant une interface proche ce que l'on pourrait trouver sur un vrai forum. Par exemple, les requêtes de suppression et de modification sont lancés via des boutons "Modifier" et "Supprimer". Les vues par défaut (liste de joueurs, de jeux, de commentaire) correspondent aux requêtes de sélections demandés dans le sujet et peuvent être le cas échéant paramétrés via des menus déroulants ou des champs de saisie.

Les sources de l'application sont contenues dans le dossier `source/frontend` et sont réparties de la manière suivante :
```
source
  └── frontend
       ├── public
       ├── src
       │   ├── components // Composants utilisés
       │   ├── routes   // Routes pour le changement 
       │   │               de vues
       │   ├── vues     // Vues de l'application
       │   ├── types    // Typage des données       
       │   │               récupérées
       │   ├── main.ts // Application principale      
       │   │              chargeant la vue App.vue
       │   └── App.vue
       ├── package.json
       └── vue.config.js // Configuration de Vue.JS
```