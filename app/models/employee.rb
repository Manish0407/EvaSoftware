class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :contacts, dependent: :destroy
  has_many :opportunities, dependent: :destroy

  validates :first_name, presence: { message: "First name is required" } 
  validates :last_name, presence: { message: "Last name is required" } 
  validates :email, presence: { message: "Email is required" },
                    format: { 
                      with: /\A[a-zA-Z0-9._%+-]+@gmail\.[a-zA-Z]{2,}\z/, 
                      message: "must be a valid gmail " 
                    }
  validates :password, presence: { message: "Password name is required" } 
  
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["city", "country", "created_at", "email", "encrypted_password", "first_name", "id", "id_value", "last_name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "state", "updated_at"]
  end     

  ROLES = %i[employee admin super_admin]

  def role?(base_role)
    ROLES.index(base_role.to_sym) <= ROLES.index(role.to_sym)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
