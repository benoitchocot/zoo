class AnimalsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_animals_data
  before_action :check_admin, only: [:create, :update]


  def index
    @animals = Animal.left_joins(espece: :enclo).all
    @animals_par_espece = @animals.group_by { |animal| animal.espece }
  end

  def index_json
    animals_data = File.read('json/animaux.json')
    @animals = JSON.parse(animals_data)

    especes_data = File.read('json/especes.json')
    @especes = JSON.parse(especes_data)

    enclos_data = File.read('json/enclos.json')
    enclos = JSON.parse(enclos_data)

    @animals_par_enclos = {}

    @animals.each do |animal|
      espece = animal['espece']

      @especes.each do |espece_data|
        if espece_data['_id'] == espece
          @animals_par_enclos[espece] = espece_data['enclos']
          break
        end
      end
    end

    @especes_par_enclos = {}

    @especes.each do |espece|
      enclos_id = espece['enclos']

      # Trouver l'enclos correspondant dans les données d'enclos.json
      enclos.each do |enclos_data|
        if espece['enclos'] == enclos_data['_id']
          @especes_par_enclos[espece['_id']] = {
            'enclos_nom' => enclos_data['nom'],
            'superficie' => enclos_data['superficie'],
            'zone' => enclos_data['zone'],
          }
          break
        end
      end
    end
  end


  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      redirect_to @animal
    else
      render :new
    end
  end


  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    if current_user && current_user.is_admin

      @animal = Animal.find(params[:id])

      if @animal.update(animal_params)
        redirect_to @animal
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    redirect_to root_path, status: :see_other
  end



def new_json
  @animals = Animal.new
  respond_to do |format|
    format.html { render 'new' }
    format.json { render json: @animal } # Par exemple, répondre avec du JSON
  end
end

def create_json
  new_animal = { "nom" => params[:nom], "espece" => params[:espece], "naissance" => params[:naissance], "deces" => params[:deces], "sexe" => params[:sexe], "observations" => params[:observations], "position" => params[:position] }
  @animals_data << new_animal

  save_animals_data

  render json: new_animal, status: :created
end

def show_json
  animals_id = params[:id].to_i - 1  # Soustraire 1 car l'index commence à 0
  animals_data = File.read('json/animaux.json')
  parsed_data = JSON.parse(animals_data)
  animals = parsed_data[animals_id]
  if animals
    render json: animals
  else
    render json: { error: 'Animal not found' }, status: :not_found
  end
end

def reset_animals
  # Chemin vers les fichiers JSON
  template_path = Rails.root.join('json/animals_template.json')
  animals_path = Rails.root.join('json/animaux.json')

  # Copie du contenu de animals_template.json vers animaux.json
  FileUtils.cp(template_path, animals_path)

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
  puts "Erreur lors du chargement des données des animals : #{e.message}"
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

def set_animal
  @animal = Animal.find(params[:id])
end

def animal_params
  params.require(:animal).permit(:nom, :espece, :naissance, :deces, :sexe, :observations, :position)
end

end
