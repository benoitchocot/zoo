# Utiliser une image Ruby on Rails
FROM ruby:3.2

# Créer et définir le répertoire de travail
WORKDIR /app

# Copier le Gemfile et le Gemfile.lock pour installer les dépendances
COPY Gemfile Gemfile.lock ./

# Installer les gems
RUN bundle install


# Copier le reste des fichiers de l'application dans le conteneur
COPY . .

# Exposer le port 3000
EXPOSE 3000

# Commande pour démarrer l'application Rails
# Copier le script d'entrée dans l'image
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Définir le script d'entrée comme point d'entrée
ENTRYPOINT ["docker-entrypoint.sh"]