class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car added"
      redirect_to cars_path
    else
      flash[:notice] = "Car was not added"
      render :new
    end

    def show
      @car = Car.find(params[:id])
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage, :description)
  end

end
