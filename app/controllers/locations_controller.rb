class LocationsController < ApplicationController
  before_action :set_location, only: [:edit, :update, :destroy]
  
  def index
    @locations = Location.all.order(created_at: :desc)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to locations_path, notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path, notice: 'Location was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: 'Location was successfully deleted.'
  end

  private

  def location_params
    params.require(:location).permit(:country, :state, :city, :location_code)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
