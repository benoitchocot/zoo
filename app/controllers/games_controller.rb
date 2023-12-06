# game_controller.rb
class GamesController < ApplicationController
  # Action pour afficher la page du jeu


  # Action spécifique à l'API pour récupérer les données des animaux
  def animals_api
    animals = Animal.all
    render json: animals
  end

  def import_data
    file_path = 'data/animaux.json'
    animals_data = JSON.parse(File.read(file_path))

    animals_data.each do |animal_data|
      Animal.create(
        _id: animal_data['_id'],
        nom: animal_data['nom'],
        especenom: animal_data['especenom'],
        naissance: animal_data['naissance'],
        deces: animal_data['deces'],
        sexe: animal_data['sexe'],
        observations: animal_data['observations'],
        position: animal_data['position']
      )
    end

    redirect_to games_path, notice: 'Importation des animaux terminée !'
  end
end
