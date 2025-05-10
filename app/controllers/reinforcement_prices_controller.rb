class ReinforcementPricesController < ApplicationController
  require 'axlsx'
  require 'roo'
  before_action :set_reinforcement_price, only: [:edit, :update, :destroy]

  def index
    @reinforcement_prices = ReinforcementPrice.all.page(params[:page]).per(10).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.csv { send_data @reinforcement_prices.to_csv }
      # format.xls
    end
  end

  def new
    @reinforcement_price = ReinforcementPrice.new
  end

  def create
    @reinforcement_price = ReinforcementPrice.new(reinforcement_price_params)
    if @reinforcement_price.save
      redirect_to reinforcement_prices_path, notice: 'Raw Material Price was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reinforcement_price.update(reinforcement_price_params)
      redirect_to reinforcement_prices_path, notice: 'Raw Material Price was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reinforcement_price.destroy
    redirect_to reinforcement_prices_path, notice: 'Raw Material Price was successfully deleted.'
  end

  def download_price_list
    @reinforment_price_records = ReinforcementPrice.all

    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=Reinforment_price_list.xlsx"
      end
    end
  end

  private

  def set_reinforcement_price
    @reinforcement_price = ReinforcementPrice.find(params[:id])
  end

  def reinforcement_price_params
    params.require(:reinforcement_price).permit(:rm_code, :item_name,:brand_name, :unit, :default_price_rate, :raw_material_type, :select_price_level, :price_file)
  end
end
