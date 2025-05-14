class Quote < ApplicationRecord
	belongs_to :opportunity
	has_many :windows, dependent: :destroy
	# has_one :won_loss_detail, as: :won_lossable, dependent: :destroy
  	# accepts_nested_attributes_for :won_loss_detail


  	# after_save :update_related_opportunity

  	# private

  	# def update_related_opportunity
    # 	return unless won_loss_detail.present?

	#     if opportunity.won_loss_detail.nil?
	#       opportunity.create_won_loss_detail(
	#         won_or_loss: won_loss_detail.won_or_loss,
	#         project_name: won_loss_detail.project_name,
	#         stage: won_loss_detail.stage,
	#         account: won_loss_detail.account,
	#         competitor: won_loss_detail.competitor,
	#         expected_delivery_date: won_loss_detail.expected_delivery_date,
	#         reason: won_loss_detail.reason
	#       )
	#     else
	#       opportunity.won_loss_detail.update(
	#         won_or_loss: won_loss_detail.won_or_loss,
	#         project_name: won_loss_detail.project_name,
	#         stage: won_loss_detail.stage,
	#         account: won_loss_detail.account,
	#         competitor: won_loss_detail.competitor,
	#         expected_delivery_date: won_loss_detail.expected_delivery_date,
	#         reason: won_loss_detail.reason
	#       )
	#     end
  	# end
end
