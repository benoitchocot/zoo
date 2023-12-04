#!/bin/bash
set -e

# Exécuter les migrations de base de données
bundle exec rails db:migrate

# Lancer le serveur Rails
bundle exec rails server -b '0.0.0.0'
