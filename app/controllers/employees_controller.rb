  # before_action :set_current_user

  # def set_current_user
  #   @current_user ||= Employee.find(current_employee.id)
  # end


class EmployeesController < ApplicationController
  before_action :set_current_user, only: [:show, :edit, :update]

  def index
    if params[:search]
      @employees = Employee.where('full_name LIKE ?', "%#{params[:search]}%")
    else
      @employees = Employee.all.order(created_at: :desc)
    end
  end

  def show
  end

  def edit
  end

   def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee, notice: 'Your employee was successfully created.'
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_current_user
    @employee = current_employee
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :phone_number, :city, :state, :country, :employee_id)
  end
end
