class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings/new
  def new
    #Validation to checks if parameters are present and valid.
    if params[:showing].present? && Showing.exists?(params[:showing]) 
      #Create new booking and set the showing to the input parameter
      @booking = Booking.new
      @booking.showing_id = params[:showing]
      #Initialize occupied seat array
      @occupied = []
      @bookings =  Booking.where(showing: params[:showing])

      ##Iterate through all bookings for this showing and add the seat and row to the occupied array 
      @bookings.each do |booking|
        subarray = [booking.seat,booking.row]
        @occupied.push(subarray)
      end

      unique_ticket = false
      new_E_ticket = '' #Initalize nwe E_ticket string.
      while !unique_ticket do
        new_E_ticket = (('A'..'Z').to_a.shuffle[0,8].join).upcase() #Generate new E_ticket
        unique_ticket = true
        #If E_ticket alreay used, generate new E_ticket
        @bookings.each do |booking|
        if (booking.E_ticket == new_E_ticket)
          unique_ticket = true
          end
        end
      end

    @booking.E_ticket = new_E_ticket;
    else
      #If parameter invalid, redirect with error.
      redirect_to root_url
      flash[:alert] = t("bookings.new.invalid")
    end
  
  end


  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  # POST /ParseAjax
  # Method to create multiple bookings from the same ajax call.
  def parseAjax
    #Validation to ensure that ajax parameters are present
    if params[:seatPosArray].present? && params[:booking].present?
      seatsHash = params[:seatPosArray]
      booking_hash = params[:booking].values
      new_booking = {}
      # Set booking values from ajax data parameter
      new_booking["name"] = booking_hash[2].values[1]
      new_booking["email"] = booking_hash[3].values[1]
      new_booking["showing_id"] = booking_hash[4].values[1].to_i
      new_booking["E_ticket"] = booking_hash[7].values[1]      
      
      valid = true
      # Iterate through each seat in the seat hassh,
      seatsHash.each do |key, value|
        new_booking["seat"] = value[0] 
        new_booking["row"] = value[1]
        @booking = Booking.create(new_booking) #Create a new booking with each seat in seat hash.

        if !@booking.save
          valid = false #If a booking is not valid set the invalid flag.
        end
      end
    end 

    respond_to do |format|
      if valid #If valid, redirect to view the booking page
        format.html { redirect_to :controller => "my_bookings", :action => "find", :E_ticket => @booking.E_ticket, :notice => "Booking Successful!"}
      else
        format.html { render :new } #Else render with error.
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

 

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
    format.html { redirect_to root_url, notice: 'Booking was successfully destroyed.' }
    format.json { head :no_content }
   
     
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
     
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:showing_id, :name, :email, :seat, :row, :E_ticket)
    end
end
