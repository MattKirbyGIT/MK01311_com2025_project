class ShowingsController < ApplicationController
  before_action :set_showing, only: [:show, :edit, :update, :destroy]

  

  # GET /showings
  # GET /showings.json
  def index 
    if params[:film].present?
      @film = Film.find(params[:film])
      @showings = Showing.where(film: params[:film])
      uniqueVenue_ids = Showing.where(film: params[:film]).pluck(:venue_id).uniq
      @uniqueVenues = Venue.find(uniqueVenue_ids)
      @venueShowings = []
      @uniqueVenues.each do |i|
        @venueShowings.append(Showing.where(film: params[:film],venue_id: i.id))
      end
    else
      redirect_to root_url, notice: "Error selecting showing. No film selected!"
    end
  end

 

  
end
