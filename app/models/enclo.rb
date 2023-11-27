class Enclo < ApplicationRecord
  belongs_to :espece, foreign_key: "_id"

end
