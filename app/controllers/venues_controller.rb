class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index 
    if params[:film].present?
      if Film.exists?(params[:film])
        @film = Film.find(params[:film])
        uniqueVenue_ids = Showing.where(film: params[:film]).pluck(:venue_id).uniq
        @uniqueVenues = Venue.find(uniqueVenue_ids)  
      else
        redirect_to films_url
        flash[:alert] = t("venues.index.no_param")
      end 
    else
      redirect_to root_url
      flash[:alert] = t("venues.index.bad_param")
    end 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :location, :image_url, :rows, :seats_per_row)
    end
end
