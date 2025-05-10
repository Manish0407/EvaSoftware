class PaymentGateway < ApplicationRecord
	validates :opportunity_id, presence: { message: "Opportunity is required"}
	validates :payment_medium, presence: { message: "Payment medium is required"}
	validates :amount, presence: { message: "Amount is required"}
	validates :payment_date_and_time, presence: { message: "Payment data and time is required"}
	validates :audit_status, presence: true, unless: :pending_status?
  	validates :reason, presence: true, if: -> { audit_status.in?(%w[approve rejected]) }
	
	enum audit_status: { pending: 0, approve: 1, rejected: 2 }

	after_initialize :set_default_audit_status, if: :new_record?

 	private

	def pending_status?
		audit_status == "pending"
	end

  	def set_default_audit_status
    	self.audit_status ||= :pending
  	end
end
