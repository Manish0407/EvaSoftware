class Opportunity < ApplicationRecord
  has_many :quotes
  
  validates :full_name, presence: { message: "Full name can't be blank" }
  validates :employee_id, presence: { message: "Employee name can't be blank" }
  validates :project_name, presence: { message: "Project name can't be blank" }
  validates :opportunity_stage, presence: { message: "Opportunity stage can't be blank" }
  validates :opportunity_source, presence: { message: "Opportunity source can't be blank" }
  validates :phone_number, :presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }

  def self.group_by_day
    opportunities = all
    opportunities_by_day = opportunities.group_by { |op| op.created_at.to_date }
    opportunities_by_day.transform_values(&:size)
  end

  def self.group_by_week
    opportunities = all
    opportunities_by_week = opportunities.group_by { |op| op.created_at.beginning_of_week }
    opportunities_by_week.transform_values(&:size)
  end

  def self.group_by_month
    opportunities = all
    opportunities_by_month = opportunities.group_by { |op| op.created_at.beginning_of_month }
    opportunities_by_month.transform_values(&:size)
  end

  def self.group_by_quarter
    opportunities = all
    opportunities_by_quarter = opportunities.group_by { |op| (op.created_at.month - 1) / 3 + 1 }
    opportunities_by_quarter.transform_values(&:size)
  end

  def self.group_by_year
    opportunities = all
    opportunities_by_year = opportunities.group_by { |op| op.created_at.year }
    opportunities_by_year.transform_values(&:size)
  end
end
