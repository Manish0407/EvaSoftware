class HomeController < ApplicationController
    def index
    @created_opportunities_count = Opportunity.count
    @total_estimated_value = Opportunity.sum(:estimated_opportunity_value).to_i

      # Prepare data for charts
    @opportunities_count_data = { "Total Opportunities" => @created_opportunities_count }
    @opportunities_value_data = { "Total Estimated Value" => @total_estimated_value }
 

    @opportunities_data = case params[:view]
                          when 'daily'
                            Opportunity.group_by_day
                          when 'weekly'
                            Opportunity.group_by_week
                          when 'monthly'
                            Opportunity.group_by_month
                          when 'quarterly'
                            Opportunity.group_by_quarter
                          when 'yearly'
                            Opportunity.group_by_year
                          else
                            Opportunity.group_by_week
                          end
  end
end
