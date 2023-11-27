require 'faker'

class Animal < ApplicationRecord
  belongs_to :espece, foreign_key: "_id"

  def self.generate_random_animal
    nom = Faker::Name.name
    espece = Faker::Creature::Animal.name

    Animal.create(nom: nom, espece: espece)
  end


  validates :nom, presence: true
  validates :espece, presence: true
end
