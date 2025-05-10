require "test_helper"

class HardwarePricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hardware_prices_index_url
    assert_response :success
  end

  test "should get new" do
    get hardware_prices_new_url
    assert_response :success
  end
end
