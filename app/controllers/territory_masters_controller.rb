class TerritoryMastersController < ApplicationController
  before_action :set_location, only: [:edit, :update, :destroy]
  
  def index
    @territory_masters = TerritoryMaster.all.order(created_at: :desc)
  end

  def new
    @territory_master = TerritoryMaster.new
  end

  def create
    @territory_master = TerritoryMaster.new(location_params)
    
    if @territory_master.save
      redirect_to territory_masters_path, notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @territory_master.update(location_params)
      redirect_to territory_masters_path, notice: 'Territory_master was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @territory_master.destroy
    redirect_to territory_masters_path, notice: 'Territory_master was successfully deleted.'
  end

  private

  def location_params
    params.require(:territory_master).permit(:territory_name, :territory_description)
  end

  def set_location
    @territory_master = TerritoryMaster.find(params[:id])
  end
end
