class Account < ApplicationRecord
	has_many :contacts
	validates :account_name,  presence: { message: "Account name can't be blank" }
	validates :employee_id,  presence: { message: "Employee name can't be blank" }
	validates :email, presence: { message: "Email is required" },
                    format: { 
                      with: /\A[a-zA-Z0-9._%+-]+@gmail\.[a-zA-Z]{2,}\z/, 
                      message: "must be a valid gmail " 
                    }
    validates :phone_number, :presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }

end
