class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :all_articles]
  before_action :check_admin, only: [:create, :update]

  def index
    @articles = Article.order(created_at: :desc).limit(3) # Récupérer les 3 articles les plus récents

    # Charger les données du fichier JSON
    animaux_data = File.read('json/animaux.json')
    animaux = JSON.parse(animaux_data)

    # Sélection aléatoire de 10 animaux
    @animaux_random = animaux.sample(10)
  end

  def all_articles
    @articles = Article.all # Récupérer tous les articles pour la page avec tous les articles
  end
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if current_user && current_user.is_admin

      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  private

    def article_params
      params.require(:article).permit(:titre, :body, :status, :image)
    end

    def check_admin
      unless current_user.is_admin?
        redirect_to root_path, alert: "Vous n'avez pas la permission d'accéder à cette fonctionnalité."
      end
    end
end
