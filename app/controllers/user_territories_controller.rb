class UserTerritoriesController < ApplicationController
  before_action :set_user_territory, only: [:edit, :update, :destroy]

  def index
    @user_territories = UserTerritory.all.order(created_at: :desc)
  end

  def new
    @user_territorie = UserTerritory.new
    @available_employee_names = available_employee_names
  end

  def create
    @user_territorie = UserTerritory.new(location_params)

    if @user_territorie.save
      redirect_to user_territories_path, notice: 'User territory was successfully created.'
    else
      render :new
    end
  end

  def edit
    @available_employee_names = available_employee_names
  end

  def update
    if @user_territorie.update(location_params)
      redirect_to user_territories_path, notice: 'User territory was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user_territorie.destroy
    redirect_to user_territories_path, notice: 'User territory was successfully deleted.'
  end

  private

  def location_params
    params.require(:user_territory).permit(:employee_id, :territory_master_id)
  end

  def set_user_territory
    @user_territorie = UserTerritory.find(params[:id])
  end

  def available_employee_names
    if action_name == 'new'
      Employee.where.not(id: UserTerritory.pluck(:employee_id))
    else
      Employee.where(id: UserTerritory.pluck(:employee_id))
    end
  end
end
