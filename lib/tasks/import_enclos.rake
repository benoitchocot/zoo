# use rails db:import_enclos

require 'json'

namespace :db do
  desc 'Import enclos from JSON file'
  task import_enclos: :environment do
    file_path = 'json/enclos.json'
    enclos_data = JSON.parse(File.read(file_path))

    enclos_data.each do |enclo_data|
      Enclo.create(_id: enclo_data['_id'], nom: enclo_data['nom'], zone: enclo_data['zone'], coordonnees: enclo_data['coordonnees'], superficie: enclo_data['superficie'], __t: enclo_data['__t'], temperatureMini: enclo_data['temperatureMini'], temperatureMaxi: enclo_data['temperatureMaxi'],hygrometrie: enclo_data['hygrometrie'], temperature: enclo_data['temperature'])
    end

    puts 'Import finished!'
  end
end
