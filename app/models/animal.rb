require 'faker'

class Animal < ApplicationRecord
  belongs_to :espece, foreign_key: "espece_nom", primary_key: "_id", optional: true
  def self.generate_random_animal
    nom = Faker::Name.name
    espece_nom = Faker::Creature::Animal.name

    Animal.create(nom: nom, espece_nom: espece_nom)
  end


  validates :nom, presence: true
  validates :espece_nom, presence: true
end
