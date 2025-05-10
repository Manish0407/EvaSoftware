class PaymentGatewaysController < ApplicationController
  def index
    if params[:search]
      @payment_gateways = Opportunity.where('project_name LIKE ?', "%#{params[:search]}%")
    else
      @payment_gateways = PaymentGateway.all.order(created_at: :desc)
    end
  end

  def new
    @payment_gateway = PaymentGateway.new
  end

  def create
    @payment_gateway = PaymentGateway.new(payment_gateway_params)
    if @payment_gateway.save
      redirect_to payment_gateways_path, notice: 'Payment gateway was successfully created.'
    else
      render :new
    end
  end

  def edit
    @payment_gateway = PaymentGateway.find(params[:id])
  end

  def update_audit_status
    @payment_gateway = PaymentGateway.find(params[:id])
    if @payment_gateway.update(audit_status: params[:payment_gateway][:audit_status], reason: params[:payment_gateway][:reason])
      redirect_to payment_gateways_path, notice: 'Audit status was successfully updated.'
    else
      redirect_to payment_gateways_path, alert: 'Failed to update audit status.'
    end
  end
 
  private

  def payment_gateway_params
    params.require(:payment_gateway).permit(:opportunity_id, :payment_medium, :transaction_no, :amount, :payment_date_and_time, :description, :audit_status, :reason)
  end
end
