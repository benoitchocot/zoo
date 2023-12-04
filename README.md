# Bienvenue sur le Projet ZOO 🦁🐼🐒

Ce projet contient une documentation détaillée disponible dans le fichier [Fil Rouge Module 6 Activité 1.pdf], situé à la racine du projet.

## Installation avec Docker

Pour exécuter ce projet avec Docker, assurez-vous d'avoir installé Docker sur votre machine.

### Étapes d'installation avec Docker

1. Clonez le projet sur votre machine :
git clone https://github.com/benoitchocot/zoo.git

2. Accédez au répertoire du projet :
cd zoo

3. Construisez l'image Docker :
docker build -t nom_image:tag .
- Remplacez nom_image:tag par ce que vous voulez<br>

4. Lancez le conteneur Docker avec l'application Rails :
docker run -p 3000:3000 nom_image:tag


5. Une fois le conteneur en cours d'exécution, visitez http://localhost:3000 dans votre navigateur pour accéder à l'application.

## Installation sans Docker

Si vous préférez installer l'application sans utiliser Docker, suivez ces étapes :

1. Assurez-vous d'avoir Ruby et SQLite3 installés sur votre machine.

2. Clonez le projet :
git clone https://github.com/benoitchocot/zoo.git

3. Accédez au répertoire du projet :
cd zoo

4. Installez les dépendances :
bundle install

5. Effectuez la migration de la base de données :
rails db:migrate

6. Importez les données du zoo :
rails import:zoo

7. Pour lancer l'application, exécutez la commande suivante :
bin/rails server

8. Visitez http://localhost:3000 dans votre navigateur pour accéder au projet.
