class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end


  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)

    if @visit.save
      redirect_to @visit
    else
      flash[:error] = @visit.errors.full_messages.join(', ')
      render :new
    end
  end


  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    if current_user && current_user.is_admin

      @visit = Visit.find(params[:id])

      if @visit.update(visit_params)
        redirect_to @visit
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    redirect_to root_path, status: :see_other
  end


  private

  def visit_params
    params.require(:visit).permit(:title, :body, :status)
  end
end
