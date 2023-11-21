# app/controllers/api/articles_controller.rb
class Api::CommentsController < ApplicationController
  def index
    articles = File.read('json/animaux.json')
    render json: articles
  end
end
