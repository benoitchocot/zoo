# game_controller.rb
class GameController < ApplicationController
  # Action pour afficher la page du jeu

  def show
    # Votre logique pour afficher la page du jeu
  end

  # Action spécifique à l'API pour récupérer les données des animaux
  def animals_api
    animals = Animal.all
    render json: animals
  end
end
