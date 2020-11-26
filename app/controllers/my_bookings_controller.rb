class MyBookingsController < ApplicationController

    def find
        query = params[:E_ticket]

        @bookings =  Booking.where(E_ticket: query)
        
        respond_to do |format|
            if @bookings.length > 0
        
              format.html { render :find}
            else
                format.html { render :find}
             
            end
          end
    end

end
