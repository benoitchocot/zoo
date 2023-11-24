# use rails animals:generate

namespace :animals do
  desc "Generate random animals"
  task generate: :environment do
    Faker::Config.locale = 'fr'
    30.times do
      Animal.generate_random_animal
    end
    puts "Generated 30 random animals"
  end
end
