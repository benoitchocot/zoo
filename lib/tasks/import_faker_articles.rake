# use rails articles:generate

namespace :articles do
  desc "Generate fake articles in French related to animals"
  task generate: :environment do
    10.times do
      Article.generate_fake_articles
    end
    puts "Generated 10 fake articles in French related to animals"
  end
end
