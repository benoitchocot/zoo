# animal.rb (dans app/models/animal.rb pour Rails)
require 'faker'

class Animal < ApplicationRecord
  def self.generate_random_animal
    nom = Faker::Name.name
    espece = Faker::Creature::Animal.name

    Animal.create(nom: nom, espece: espece)
  end
end
