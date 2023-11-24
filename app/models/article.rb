# app/models/article.rb

require 'faker'

class Article < ApplicationRecord
  include Visible

  validates :titre, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def self.generate_fake_articles
      title = Faker::Creature::Animal.name.capitalize
      content = "Actualité sur les #{title} :\n\n" +
                Faker::Lorem.paragraphs(number: 2).join("\n\n")
                + Faker::Lorem.paragraphs(number: 3).join("\n\n") +
                "\n\n"

      article = Article.new(
        titre: title,
        body: content,
        status: "public"
      )
      unless article.save
        puts "Erreur lors de la création de l'article : #{article.errors.full_messages}"
      end
    end
  end
