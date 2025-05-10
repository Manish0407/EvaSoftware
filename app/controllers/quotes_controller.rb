class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit]
  def index
    if params[:search]
      @quotes = Quote.where('project_name LIKE ?', "%#{params[:search]}%")
    else
      @quotes = Quote.all.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @quote = Quote.new
    @available_opportunities = available_opportunities
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quotes_path, notice: 'quote created successfully.'
    else
      render :new
    end
  end

  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: 'Quote updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:opportunity_id, :expected_quote_start_date, :expected_quote_end_date)
  end

  def available_opportunities
    used_opportunity_ids = Quote.pluck(:opportunity_id)
    Opportunity.where.not(id: used_opportunity_ids)
  end
end
