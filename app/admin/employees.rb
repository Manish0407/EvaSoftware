ActiveAdmin.register Employee do

  # permit_params :first_name, :last_name, :email, :phone_number, :city, :state, :country, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :phone_number, :city, :state, :country, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :first_name, :last_name, :email, :phone_number, :city, :state, :country, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  filter :first_name
  filter :last_name
  filter :email
  filter :phone_number
  filter :city
  filter :state
  filter :country
  filter :created_at
  filter :updated_at


  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :city
      f.input :state
      f.label :country, "Country", style: "margin-right: 312px; padding-left: 10px;"
      f.country_select :country, {}, { class: 'form-control' }
      f.input :encrypted_password
    end
    f.actions
  end

  index title: 'Employee' do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :city
    column :state
    column :country
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone_number
      row :city
      row :state
      row :country
      row :encrypted_password
    end
  end
end
