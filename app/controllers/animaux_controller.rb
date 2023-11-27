# app/controllers/animaux_controller.rb
class AnimauxController < ApplicationController
  def index
    animaux_data = File.read('json/animaux.json')
    @animaux = JSON.parse(animaux_data)
  end
end
