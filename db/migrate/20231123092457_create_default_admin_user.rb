# db/devise/[timestamp]_create_default_admin_user.rb
class CreateDefaultAdminUser < ActiveRecord::Migration[7.1] # Assurez-vous de spécifier la version correcte d'Active Record
  def up
    User.create!(
      email: 'admin@swag.com',
      password: 'swagmax',
      is_admin: true # Assurez-vous que votre modèle User a un attribut is_admin
      # Ajoutez d'autres champs d'utilisateur si nécessaire
    )
  end

  def down
    admin_user = User.find_by(email: 'admin@swag.com')
    admin_user.destroy if admin_user
  end
end
