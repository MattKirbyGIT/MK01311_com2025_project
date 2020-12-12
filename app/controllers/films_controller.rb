class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]

  # GET /films
  # GET /films.json
  def index
    @films = Film.all
  end

  # Default show method
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Validation for film parameter. If invalid, redirect with alert to films index.
    def set_film
      if Film.exists?(id: params[:id])
        @film = Film.find(params[:id])
      else
        redirect_to films_path
        flash[:alert] = t('films.film.no_film')
      end
      
    end

  
end
