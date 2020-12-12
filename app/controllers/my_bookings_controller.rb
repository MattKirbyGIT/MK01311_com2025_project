class MyBookingsController < ApplicationController

  # GET my_bookings#find
  # Handle the showinf of the find view to show a specific booking
  # Takes in E_ticket param to find all bookings woth that e_ticket.
  def find
    # Param validation
    if params[:E_ticket].present? 
      query = params[:E_ticket]
      @bookings =  Booking.where(E_ticket: query)
      # If there are no bookings for that ticket, then redirect to the search page with an error.
      respond_to do |format|
        if @bookings.length > 0
          format.html { render :find}
        else
          format.html { redirect_to '/mybookings', notice: t('my_bookings.index.notFound')}
        end
      end
    else
      #If param not present, redirect with alert
      redirect_to '/mybookings'
      flash[:alert] = t("my_bookings.index.notFound")
    end
  end
end
