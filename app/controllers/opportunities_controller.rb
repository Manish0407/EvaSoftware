class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @opportunities = Opportunity.where('project_name LIKE ?', "%#{params[:search]}%")
    else
      @opportunities = Opportunity.all.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @opportunity = Opportunity.new
  end

  def edit
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    if @opportunity.save
      redirect_to opportunities_path, notice: 'Opportunity created successfully.'
    else
      render :new
    end
  end

  def update
    if @opportunity.update(opportunity_params)
      redirect_to opportunities_path, notice: 'Opportunity updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @opportunity.destroy
    redirect_to opportunities_path, notice: 'Opportunity deleted successfully.'
  end

  private

  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:project_name, :salutation, :full_name, :phone_number, :email, :note, :address1, :address2, :zip_code, :city, :state, :country, :bill_to, :marketing_partner, 
      :employee_id, :opportunity_stage, :opportunity_source, :opportunity_category, :estimated_opportunity_value, :expected_closure_date, :expected_supply_start_date, 
      :expected_supply_end_date)
  end
end
