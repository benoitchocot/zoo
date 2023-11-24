# app/controllers/api/animaux_controller.rb
class Api::AnimauxController < ApplicationController

  def index
    @animaux = Animal.all

    animaux = File.read('json/animaux.json')
    render json: animaux
  end

  def show
    animaux_id = params[:id].to_i - 1  # Soustraire 1 car l'index commence à 0

    animaux_data = File.read('json/animaux.json')
    parsed_data = JSON.parse(animaux_data)

    animaux = parsed_data[animaux_id]

    if animaux
      render json: animaux
    else
      render json: { error: 'Animal not found' }, status: :not_found
    end
  end

end
