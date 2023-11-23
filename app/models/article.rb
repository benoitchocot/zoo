class Article < ApplicationRecord
  include Visible

  validates :titre, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
