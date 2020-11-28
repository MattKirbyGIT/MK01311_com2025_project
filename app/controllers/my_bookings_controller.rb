class MyBookingsController < ApplicationController

  def find
    query = params[:E_ticket]
    @bookings =  Booking.where(E_ticket: query)
    respond_to do |format|
      if @bookings.length > 0
        format.html { render :find}
      else
        format.html { redirect_to '/mybookings', notice: t('my_bookings.index.notFound')}
      end
    end
  end
end
