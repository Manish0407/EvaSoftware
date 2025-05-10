class RawMaterialPricesController < ApplicationController
  require 'axlsx'
  require 'roo'
  before_action :set_raw_material_price, only: [:edit, :update, :destroy]

  def index
    @raw_material_prices = RawMaterialPrice.all.page(params[:page]).per(10).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: { data: @raw_material_prices }}
      format.csv { send_data @raw_material_prices.to_csv }
      # format.xls
    end
  end

  def new
    @raw_material_price = RawMaterialPrice.new
  end

  # def create
  #   @raw_material_price = RawMaterialPrice.new(params[:product_import])
  #   if @raw_material_price.save
  #     redirect_to raw_material_prices_path, notice: 'Raw Material Price was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  def create
    @raw_material_price = RawMaterialPrice.new(raw_material_price_params)
    if @raw_material_price.save
      redirect_to raw_material_prices_path, notice: 'Raw Material Price was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @raw_material_price.update(raw_material_price_params)
      redirect_to raw_material_prices_path, notice: 'Raw Material Price was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @raw_material_price.destroy
    redirect_to raw_material_prices_path, notice: 'Raw Material Price was successfully deleted.'
  end

  def download_price_list
    @profile_price_records = RawMaterialPrice.all

    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=profile_price_list.xlsx"
      end
    end
  end

  private

  def set_raw_material_price
    @raw_material_price = RawMaterialPrice.find(params[:id])
  end

  def raw_material_price_params
    params.require(:raw_material_price).permit(:rm_code, :item_name, :brand_name, :unit, :currency, :weight_per_unit, :default_price_rate, :raw_material_type, :select_price_level, :price_file)
  end
end
