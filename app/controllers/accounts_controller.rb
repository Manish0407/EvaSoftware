class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:search]
      @accounts = Account.where('account_name LIKE ?', "%#{params[:search]}%")
    else
      @accounts = Account.all.order(created_at: :desc)
    end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path(@account), notice: 'Account created successfully.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to account_path(@account), notice: 'Account updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path, notice: 'Account deleted successfully.'
  end



  private

  def account_params
    params.require(:account).permit(:account_name, :email, :gst_number, :website, :external_account_code, :remark, :phone_number, :address1, :address2, :zip_code, :city, :state, :country, :employee_id)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
