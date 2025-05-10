require "test_helper"

class PaymentGatewaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_gateways_index_url
    assert_response :success
  end

  test "should get new" do
    get payment_gateways_new_url
    assert_response :success
  end
end
