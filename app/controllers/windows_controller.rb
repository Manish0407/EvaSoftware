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
      set_window_items
      respond_to do |format|
        format.html
        format.json { render json: { window: @window, message: "Window created successfully" } }
        format.csv { send_data @window.to_csv }
      end
    else
      render :new
    end
  end

  def show
    @window = Window.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @window }
      format.csv { send_data @window.to_csv }
    end
  end

  def edit
    @window = Window.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @window }
      format.csv { send_data @window.to_csv }
    end
  end

  def update
    @window = Window.find(params[:id])
    if @window.update(window_params)
      set_window_items
      respond_to do |format|
        format.html { redirect_to @window, notice: 'Window was successfully updated.' }
        format.json { render json: { window: @window, message: "Window updated successfully" } }
        format.csv { send_data @window.to_csv }
      end
    else
      render :edit
    end
  end

  def pricing

  end

  private

  def set_window_items
    params[:window_items].each do |key, value_array|
      value_array.each do |data|
        @window.window_items.create(material_id: data[:id], material_type: key, quantity: data[:quantity])
      end
    end

    default_price = 0.0

    @window.window_items.each do |item|
      quantity = item.quantity || 1
      default_price += (item.negotiated_price || item.material.default_price_rate) * quantity
    end

    @window.update(window_total_price: default_price * @window.quantity)
  end

  def window_params
    params.require(:window).permit(:name, :description, :design_id, :quote_id, :location, :floor_number, :note, :quantity, :glass_type, :glass_thickness, :glass_color, :glass_ref, :glass_size, :glass_weight, :glass_area, :glass_price, :glass_total_weight, :glass_rate_of_sqft, :glass_total_price, :window_total_price, :height, :width, :area, :total_weight, :image)
  end
end
