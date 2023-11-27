class AnimauxController < ApplicationController
  def index
    animaux_data = File.read('json/animaux.json')
    @animaux = JSON.parse(animaux_data)

    especes_data = File.read('json/especes.json')
    especes = JSON.parse(especes_data)

    @animaux_par_enclos = {}

    @animaux.each do |animal|
      espece = animal['espece']

      especes.each do |espece_data|
        if espece_data['_id'] == espece
          @animaux_par_enclos[espece] = espece_data['enclos']
          break
        end
      end
    end
  end
end
