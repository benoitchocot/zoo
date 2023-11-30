# use rails import:zoo
require 'json'

namespace :import do
  desc 'Import animals from JSON file'
  task zoo: :environment do
    file_path = 'json/animaux.json'
    animals_data = JSON.parse(File.read(file_path))

    animals_data.each do |animal_data|
      Animal.create(_id: animal_data['_id'], nom: animal_data['nom'], especenom: animal_data['especenom'], naissance: animal_data['naissance'], deces: animal_data['deces'], sexe: animal_data['sexe'], observations: animal_data['observations'], position: animal_data['position'])
    end
    file_path = 'json/enclos.json'
    enclos_data = JSON.parse(File.read(file_path))

    enclos_data.each do |enclo_data|
      Enclo.create(_id: enclo_data['_id'], nom: enclo_data['nom'], zone: enclo_data['zone'], coordonnees: enclo_data['coordonnees'], superficie: enclo_data['superficie'], __t: enclo_data['__t'], temperatureMini: enclo_data['temperatureMini'], temperatureMaxi: enclo_data['temperatureMaxi'],hygrometrie: enclo_data['hygrometrie'], temperature: enclo_data['temperature'])
    end

    file_path = 'json/especes.json'
    especes_data = JSON.parse(File.read(file_path))

    especes_data.each do |espece_data|
      Espece.create(_id: espece_data['_id'], nom: espece_data['nom'], sociable: espece_data['sociable'], observations: espece_data['observations'], dangereux: espece_data['dangeureux'], enclos: espece_data['enclos'])
    end

    puts 'Import finished!'
    puts 'Import finished!'
    puts 'Import finished!'
  end


end
