class SalesOfficeController < ApplicationController
  before_action :set_sales_office, only: [:edit, :update, :destroy]
  
  def index
    @sales_offices = SalesOffice.all.order(created_at: :desc)
  end

  def new
    @sales_office = SalesOffice.new
  end

  def create
    @sales_office = SalesOffice.new(sales_params)
    
    if @sales_office.save
      redirect_to sales_office_index_path, notice: 'sales office was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sales_office.update(sales_params)
      redirect_to sales_office_index_path, notice: 'sales_office was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sales_office.destroy
    redirect_to sales_office_index_path, notice: 'sales_office was successfully deleted.'
  end

  private

  def sales_params
    params.require(:sales_office).permit(:sales_office_name, :sales_description)
  end

  def set_sales_office
    @sales_office = SalesOffice.find(params[:id])
  end
end
