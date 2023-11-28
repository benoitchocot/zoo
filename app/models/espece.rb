class Espece < ApplicationRecord
  has_one :enclo, foreign_key: "_id", primary_key: "enclos"
end
