class AnimauxController < ApplicationController

  def index
    @animaux = Animal.left_joins(espece: :enclo).all
  end

  def index_json
    animaux_data = File.read('json/animaux.json')
    @animaux = JSON.parse(animaux_data)

    especes_data = File.read('json/especes.json')
    @especes = JSON.parse(especes_data)

    enclos_data = File.read('json/enclos.json')
    enclos = JSON.parse(enclos_data)

    @animaux_par_enclos = {}

    @animaux.each do |animal|
      espece = animal['espece']

      @especes.each do |espece_data|
        if espece_data['_id'] == espece
          @animaux_par_enclos[espece] = espece_data['enclos']
          break
        end
      end
    end

    @especes_par_enclos = {}

    @especes.each do |espece|
      enclos_id = espece['enclos']

      # Trouver l'enclos correspondant dans les données d'enclos.json
      enclos.each do |enclos_data|
        if espece['enclos'] == enclos_data['_id']
          @especes_par_enclos[espece['_id']] = {
            'enclos_nom' => enclos_data['nom'],
            'superficie' => enclos_data['superficie'],
            'zone' => enclos_data['zone'],
          }
          break
        end
      end
    end
  end
end
