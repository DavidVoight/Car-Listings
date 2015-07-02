class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "Manufacturer saved."
      redirect_to manufacturers_path
    else
      flash[:notice] = "Manufacturer not saved."
      render :new
    end
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @cars = Car.where(manufacturer_id: params[:id])
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
