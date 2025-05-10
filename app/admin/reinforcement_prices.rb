ActiveAdmin.register ReinforcementPrice do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :rm_code, :item_name, :brand_name, :unit, :currency, :default_price_rate, :weight_per_unit, :parent_code, :select_price_level, :rate_calculate_formula
  #
  # or
  #
  # permit_params do
  #   permitted = [:rm_code, :item_name, :brand_name, :unit, :currency, :default_price_rate, :weight_per_unit, :parent_code, :select_price_level, :rate_calculate_formula]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
   filter :rm_code
  filter :item_name
  filter :brand_name
  filter :unit
  filter :attachment, as: :string, label: 'Attachment', if: false

  index do
    selectable_column
    id_column
    column :rm_code
    column :item_name
    column :brand_name
    column :unit
    column :default_price_rate
    actions
  end


end
