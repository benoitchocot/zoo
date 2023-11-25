# app/controllers/api/animaux_controller.rb
class Api::AnimauxController < ApplicationController
  before_action :load_animals_data
  require 'json'


  def index
    @animaux = Animal.all

    animaux = File.read('json/animaux.json')
    render json: animaux
  end

  # POST /animaux
  def create
    new_animal = { "nom" => params[:nom], "espece" => params[:espece] }
    @animals_data << new_animal

    save_animals_data

    render json: new_animal, status: :created
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

    # ... Autres actions pour show, update, destroy ...

  private

  def fetch_animals_data
    JSON.parse(URI.open(ANIMAUX_JSON_URL).read)
  rescue StandardError => e
    puts "Erreur lors du chargement des données des animaux : #{e.message}"
    []
  end

  def load_animals_data
    file_path = Rails.root.join('json', 'animaux.json')
    @animals_data = JSON.parse(File.read(file_path))
  rescue Errno::ENOENT
    @animals_data = []
  end

  def save_animals_data
    file_path = Rails.root.join('json', 'animaux.json')
    File.open(file_path, 'w') do |f|
      f.write(JSON.pretty_generate(@animals_data))
    end
  end

end
