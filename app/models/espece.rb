class Espece < ApplicationRecord
  has_many :animals
  has_one :enclo, foreign_key: "_id", primary_key: "enclos"
end
