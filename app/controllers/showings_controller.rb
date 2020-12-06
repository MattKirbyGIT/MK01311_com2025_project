class ShowingsController < ApplicationController
  before_action :set_showing, only: [:show, :edit, :update, :destroy]

  

  # GET /showings
  # GET /showings.json
  def index 
    if params[:film].present?
      if Film.exists?(params[:film])
        @film = Film.find(params[:film])
        @venue = Venue.find(params[:venue])

     
        @venueShowings = Showing.where(film: params[:film],venue_id: @venue.id)

        puts "XXXXXXXXXXXX"
        puts @venueShowings.length
  
      else
        redirect_to films_url
        flash[:alert] = t("showings.index.no_param")
      end 
    else
      redirect_to root_url
      flash[:alert] = t("showings.index.bad_film")
    end 
  end
  
  def show
    
    @film = params[:film]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showing
      if Showing.exists?(id: params[:id])
        @showing = Showing.find(params[:id])
      else
        redirect_to showings_path
        flash[:alert] = t('films.film.no_film')
      end
      
    end


end


