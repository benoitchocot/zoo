class User < ApplicationRecord
  ROLES = %w[utilisateur admin].freeze

  validates :role, inclusion: { in: ROLES }

  # Méthodes pour vérifier les rôles
  def admin?
    role == 'admin'
  end
end
