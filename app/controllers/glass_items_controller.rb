class GlassItemsController < ApplicationController
  require 'axlsx'
  require 'roo'
  before_action :set_glass, only: [:edit, :update, :destroy]

  def index
    @glassitems = GlassItem.all
  end

  def new
    @glassitem = GlassItem.new
  end

  def create
    @glassitem = GlassItem.new(glass_params)
    if @glassitem.save
      redirect_to glass_items_path, notice: 'Glass was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @glassitem.update(glass_params)
      redirect_to glass_items_path, notice: 'Glass was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @glassitem.destroy
    redirect_to glass_items_path, notice: 'Glass was successfully deleted.'
  end

  def download_price_list
    @glass_items_price_records = GlassItem.all

    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=Glass_items_price_list.xlsx"
      end
    end
  end

  private

  def set_glass
    @glassitem = GlassItem.find(params[:id])
  end

  def glass_params
    params.require(:glass_item).permit(
      :enternal_code, :glass_code, :glass_thickness, :report_category, 
      :glass_weight, :unit, :glass_color, :glass_weight, :basic_value_in_sqmt, 
      :basic_value_in_sqFt, :glass_name, :glass_alias, :status
    )
  end
end
