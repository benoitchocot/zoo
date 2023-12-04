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

# Exposer le port nécessaire pour l'application Rails
EXPOSE 3000

# Commande pour démarrer l'application (exemple pour Rails)
CMD ["rails", "server"]
