class TerritoryLocationsController < ApplicationController
  before_action :set_location, only: [:edit, :update, :destroy]
  
  def index
    @territory_locations = TerritoryLocation.all.order(created_at: :desc)
  end

  def new
    @territory_location = TerritoryLocation.new
    @available_territory_names = available_territory_names
  end

  def create
    @territory_location = TerritoryLocation.new(location_params)
    
    if @territory_location.save
      redirect_to territory_locations_path, notice: 'Territory_location was successfully created.'
    else
      render :new
    end
  end

  def edit
    @territory_location = TerritoryLocation.find(params[:id])
    @available_territory_names = available_territory_names
  end

  def update
    if @territory_location.update(location_params)
      redirect_to territory_locations_path, notice: 'Territory_location was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @territory_location.destroy
    redirect_to territory_locations_path, notice: 'Territory_location was successfully deleted.'
  end

  private

  def location_params
    params.require(:territory_location).permit(:territory_master_id, :hierarchical_geography)
  end

  def set_location
    @territory_location = TerritoryLocation.find(params[:id])
  end

  def available_territory_names
    TerritoryMaster.where.not(id: TerritoryLocation.pluck(:territory_master_id))
  end

end
