# use rails db:import_especes

require 'json'

namespace :db do
  desc 'Import especes from JSON file'
  task import_especes: :environment do
    file_path = 'json/especes.json'
    especes_data = JSON.parse(File.read(file_path))

    especes_data.each do |espece_data|
      Espece.create(_id: espece_data['_id'], nom: espece_data['nom'], sociable: espece_data['sociable'], observations: espece_data['observations'], dangereux: espece_data['dangeureux'], enclos: espece_data['enclos'])
    end

    puts 'Import finished!'
  end
end
