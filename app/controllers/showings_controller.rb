class ShowingsController < ApplicationController
  before_action :set_showing, only: [:show, :edit, :update, :destroy]

  # GET /showings
  # GET /showings.json
  # Method to show all the showings for a particular film and venue.
  def index 
    # validation to ensure that the film and venue parameters are present.
    if params[:film].present? && params[:venue].present?
      # validation to both input parameters are valid
      if Film.exists?(params[:film]) && Venue.exists?(params[:venue])
        @film = Film.find(params[:film])
        @venue = Venue.find(params[:venue])
        # Get all shoings for particular venue and film
        @venueShowings = Showing.where(film: params[:film],venue_id: @venue.id)
      else #Redirect with notice if not valid
        redirect_to films_url
        flash[:alert] = t("showings.index.no_param")
      end 
    else # Redirect to root with notice if not present
      redirect_to root_url
      flash[:alert] = t("showings.index.bad_param")
    end 
  end
  
  # GET /showing/1
  def show 
    @film = params[:film]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showing
      # Validation to ensure showing has a showinf id parameter
      if Showing.exists?(id: params[:id])
        @showing = Showing.find(params[:id])
      else
        # Redirect if invalid with notice
        redirect_to showings_path
        flash[:alert] = t('films.film.no_film')
      end
      
    end


end


