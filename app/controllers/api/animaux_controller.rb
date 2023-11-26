# app/controllers/api/animaux_controller.rb
class Api::AnimauxController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_animals_data
  before_action :check_admin, only: [:new]
  
  require 'fileutils'

  require 'json'


  def index
    @animaux = Animal.all

    animaux = File.read('json/animaux.json')
    render json: animaux
  end

  def new
    @animaux = Animal.new
    respond_to do |format|
      format.html { render 'api/new' }
      format.json { render json: @animal } # Par exemple, répondre avec du JSON
    end
  end

  def create
    new_animal = { "nom" => params[:nom], "espece" => params[:espece], "naissance" => params[:naissance], "deces" => params[:deces], "sexe" => params[:sexe], "observations" => params[:observations], "position" => params[:position] }
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

  def reset_animaux
    # Chemin vers les fichiers JSON
    template_path = Rails.root.join('json/animaux_template.json')
    animaux_path = Rails.root.join('json/animaux.json')

    # Copie du contenu de animaux_template.json vers animaux.json
    FileUtils.cp(template_path, animaux_path)

    # Redirection ou réponse appropriée après la réinitialisation
    redirect_to root_path, notice: 'animaux.json a été réinitialisé avec succès !'
  end

  private

  def check_admin
    unless current_user.is_admin?
      redirect_to root_path, alert: "Vous n'avez pas la permission d'accéder à cette fonctionnalité."
    end
  end

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
