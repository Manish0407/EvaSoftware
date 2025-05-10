class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
  	 if params[:search]
      	@contacts = Contact.where('account_name LIKE ?', "%#{params[:search]}%")
    else
    	@contacts = Contact.all.order(created_at: :desc)
	end
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path(@contacts), notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
	 @contact.destroy
	 redirect_to contacts_path, notice: 'Contact was successfully destroyed.'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:salutation, :full_name, :phone_number, :email, :designation, :remark, :address1, :address2, :zip_code, :city, :state, :country, :employee_id, :account_id)
  end
end
