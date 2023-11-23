# app/models/article.rb

require 'faker'

class Article < ApplicationRecord
  include Visible

  validates :titre, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def self.generate_fake_articles(count = 10)
      title = Faker::Creature::Animal.name.capitalize
      content = Faker::Lorem.paragraphs(number: 3).join("\n\n") +
                "\n\n" +
                "Actualité sur les #{title} :\n\n" +
                Faker::Lorem.paragraphs(number: 2).join("\n\n")

      Article.create(
        titre: title,
        body: content
      )
    end
  end
