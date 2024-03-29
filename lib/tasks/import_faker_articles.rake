# use rails articles:generate

namespace :articles do
  desc "Generate fake articles in French related to animals"
  task generate: :environment do
    Faker::Config.locale = 'fr'
    puts "Début de la génération des articles..."

    10.times do
      Article.generate_fake_articles
    end

    puts "Fin de la génération des articles."

    puts "Nombre d'articles dans la base de données : #{Article.count}"

    puts "Generated 10 fake articles in French related to animals"
  end
end
