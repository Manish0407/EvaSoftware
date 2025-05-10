class Task < ApplicationRecord
	belongs_to :employee
	belongs_to :opportunity
	belongs_to :contact, optional: true

	validates :task_title, :employee_id, :task_medium, :schedule, :status, :opportunity_id, :opportunity_stage, presence: true

	STATUSES = ['open', 'close', 'Re scheduled']

	validates :status, inclusion: { in: STATUSES }

	def status_options
		STATUSES
	end
end
