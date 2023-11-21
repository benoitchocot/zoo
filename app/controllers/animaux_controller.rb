# app/controllers/animaux_controller.rb
class AnimauxController < ApplicationController
  def index
    @animaux = Animal.all
  end
end
