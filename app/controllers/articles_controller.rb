class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin, only: [:create, :update]

  def index
    @articles = Article.all
    @animaux_random = Animal.order("RANDOM()").limit(3)
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

  def view_animal
    # Utilisez votre API pour récupérer les données de l'animal
    api_controller = Api::ArticlesController.new
    api_controller.request = request
    api_controller.response = response
    api_controller.animaux

    # Vous pouvez maintenant accéder à @animal depuis la vue de cette action
    @animal = api_controller.instance_variable_get('@animal')
  end


  private
    def article_params
      params.require(:article).permit(:titre, :body, :status)
    end

    def check_admin
      unless current_user.is_admin?
        redirect_to root_path, alert: "Vous n'avez pas la permission d'accéder à cette fonctionnalité."
      end
    end
end
