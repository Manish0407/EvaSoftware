class ProfileRmItemDetailsController < ApplicationController
	require 'axlsx'
	require 'roo'
	before_action :set_profile_rm_item_detail, only: [:edit, :update]

	def index
		@profile_rm_item_details = ProfileRmItemDetail.all
	end

	def new
		@profile_rm_item_detail = ProfileRmItemDetail.new
	end

	def create
		@profile_rm_item_detail = ProfileRmItemDetail.new(profile_rm_item_detail_params)
		if @profile_rm_item_detail.save
			redirect_to profile_rm_item_details_path, notice: 'Profile RM Item Detail created successfully.'
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @profile_rm_item_detail.update(profile_rm_item_detail_params)
			redirect_to profile_rm_item_details_path, notice: 'Profile RM Item Detail updated successfully.'
		else
			render :edit
		end
	end

	def download_price_list
		@profile_rm_item_detail_records = ProfileRmItemDetail.all

		respond_to do |format|
			format.xlsx do
				response.headers['Content-Disposition'] = "attachment; filename=profile_rm_item_detail_list.xlsx"
			end
		end
	end


	private

	def set_profile_rm_item_detail
		@profile_rm_item_detail = ProfileRmItemDetail.find(params[:id])
	end

	def profile_rm_item_detail_params
		params.require(:profile_rm_item_detail).permit(
			:rm_code, :rm_item_name, :standard_bar_length, 
			:cutting_blade_thickness, :standard_bar_total_trim_length, 
			:reusable_offcut_length
			)
	end
end
