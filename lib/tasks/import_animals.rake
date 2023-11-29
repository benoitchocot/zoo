# use rails db:import_animals

require 'json'

namespace :db do
  desc 'Import animals from JSON file'
  task import_animals: :environment do
    file_path = 'json/animaux.json'
    animals_data = JSON.parse(File.read(file_path))

    animals_data.each do |animal_data|
      Animal.create(_id: animal_data['_id'], nom: animal_data['nom'], espece_nom: animal_data['espece_nom'], naissance: animal_data['naissance'], deces: animal_data['deces'], sexe: animal_data['sexe'], observations: animal_data['observations'], position: animal_data['position'])
    end

    puts 'Import finished!'
  end
end
