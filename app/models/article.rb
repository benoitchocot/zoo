# app/models/article.rb

require 'faker'

class Article < ApplicationRecord
  include Visible

  has_one_attached :image, dependent: :destroy

  validate :image_content_type#, :image_attached

  validates :titre, presence: true
  validates :body, presence: true, length: { minimum: 10 }


  def self.generate_fake_articles
      Faker::Config.locale = 'fr'
      title = Faker::Creature::Animal.name.capitalize
      content = "Actualité sur les #{title} :\n\n" +
                Faker::Lorem.paragraphs(number: 20).join("\n\n")
                "\n\n"

      valid_image_url = 'https://picsum.photos/300/200.png' # Remplacez ceci par une URL valide

      article = Article.new(
        titre: title,
        body: content,
        status: "public",
        image: ""
        )
      unless article.save
        puts "Erreur lors de la création de l'article : #{article.errors.full_messages}"
      end
    end

    private

  def image_attached
    errors.add(:image, "must be attached") unless image.attached?
  end

  def image_content_type
    return unless image.attached? # Ne vérifie le type de contenu que si une image est attachée

    allowed_types = ['image/png', 'image/jpg', 'image/jpeg']
    unless image.content_type.in?(allowed_types)
      errors.add(:image, "needs to be a PNG, JPG, or JPEG")
    end
  end

 end
