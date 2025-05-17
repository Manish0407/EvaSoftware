class WindowsController < ApplicationController
  def index
  end

  def new
    @window = Window.new()
  end

  def index
    @windows = Window.where(quote_id: params[:quote_id])
    respond_to do |format| 
      format.html
      format.json { render json: @windows }
      format.csv { send_data @windows.to_csv }
    end
  end
  
  def create
    @window = Window.new(window_params)
    if @window.save
      params[:window_items].each do |key, value_array|
        value_array.each do |item_id|
          @window.window_items.create(material_id: item_id, material_type: key)
        end
      end
      default_price = 0.0
      @window.window_items.each do |item|
        default_price += item.material.default_price_rate
      end
      @window.update(window_total_price: default_price)

      respond_to do |format|
        format.html
        format.json { render json: { window: @window, message: "Window created successfully" } }
        format.csv { send_data @window.to_csv }
      end
    else
      render :new
    end
  end

  private

  def window_params
    params.require(:window).permit(:name, :description, :design_id, :quote_id, :location, :floor_number, :note, :quantity, :glass_type, :glass_thickness, :glass_color, :glass_ref, :glass_size, :glass_weight, :glass_area, :glass_price, :glass_total_weight, :glass_rate_of_sqft, :glass_total_price, :window_total_price, :height, :width, :area, :total_weight)
  end
end
