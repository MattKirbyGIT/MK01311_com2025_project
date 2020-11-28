class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @booking.showing_id = params[:showing]
    @occupied = []
    @bookings =  Booking.where(showing: params[:showing])

    @bookings.each do |booking|
      subarray = [booking.seat,booking.row]
      @occupied.push(subarray)
    end

    unique_ticket = false
    new_E_ticket = ''
    while !unique_ticket do
      new_E_ticket = (('A'..'Z').to_a.shuffle[0,8].join).upcase()
      unique_ticket = true
      @bookings.each do |booking|
      if (booking.E_ticket == new_E_ticket)
        unique_ticket = true
        end
      end
    end

  @booking.E_ticket = new_E_ticket;
  end

  # GET /bookings/1/edit
  def edit
    @occupied = []
    showing = Booking.where(id: params[:id])
    @bookings =  Booking.where(showing: showing)

    @bookings.each do |booking|
      subarray = [booking.seat,booking.row]
      @occupied.push(subarray)
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

  def parseAjax
    seatsHash = params[:seatPosArray]
    booking_hash = params[:booking].values
    new_booking = {}
    new_booking["name"] = booking_hash[2].values[1]
    new_booking["email"] = booking_hash[3].values[1]
    new_booking["showing_id"] = booking_hash[4].values[1].to_i
    new_booking["E_ticket"] = booking_hash[7].values[1]      
   
    valid = true
    seatsHash.each do |key, value|
      new_booking["seat"] = value[0] 
      new_booking["row"] = value[1]
      @booking = Booking.create(new_booking)

        if !@booking.save
         valid = false
        end
    end 

    respond_to do |format|
      if valid
        format.html { redirect_to :controller => "my_bookings", :action => "find", :E_ticket => @booking.E_ticket, :notice => "Booking Successful!"}
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

 
  


  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
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
