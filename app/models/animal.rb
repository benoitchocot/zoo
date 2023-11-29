require 'faker'

class Animal < ApplicationRecord
  belongs_to :espece, foreign_key: "especenom", primary_key: "_id", optional: true
  def self.generate_random_animal
    nom = Faker::Name.name
    especenom = Faker::Creature::Animal.name

    Animal.create(nom: nom, especenom: especenom)
  end


  validates :nom, presence: true
  #validates :especenom, presence: true
end
