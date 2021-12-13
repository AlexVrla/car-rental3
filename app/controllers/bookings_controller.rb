class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @user = User.create!
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.car_id = 3
    # raise
    if @booking.save
      redirect_to booking_cars_path(@booking.id)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:departure_date, :departure_time, :arrival_date, :arrival_time)
  end

end
