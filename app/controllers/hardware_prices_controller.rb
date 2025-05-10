class HardwarePricesController < ApplicationController
  require 'axlsx'
  require 'roo'
  before_action :set_hardware_price, only: [:edit, :update, :destroy]

  def index
    @hardware_prices = HardwarePrice.all.page(params[:page]).per(10).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @hardware_prices }
      format.csv { send_data @hardware_prices.to_csv }
      # format.xls
    end
  end

  def new
    @hardware_price = HardwarePrice.new
  end

  def create
    @hardware_price = HardwarePrice.new(hardware_price_params)
    if @hardware_price.save
      redirect_to hardware_prices_path, notice: 'Raw Material Price was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hardware_price.update(hardware_price_params)
      redirect_to hardware_prices_path, notice: 'Raw Material Price was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hardware_price.destroy
    redirect_to hardware_prices_path, notice: 'Raw Material Price was successfully deleted.'
  end

  def download_price_list
    @hardware_price_records = ReinforcementPrice.all

    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=Hardware_price_list.xlsx"
      end
    end
  end

  private

  def set_hardware_price
    @hardware_price = HardwarePrice.find(params[:id])
  end

  def hardware_price_params
    params.require(:hardware_price).permit(:rm_code, :item_name,:brand, :unit, :price_level, :raw_material_type, :default_price_rate, :select_price_level, :price_file)
  end
end
