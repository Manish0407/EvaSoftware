require "test_helper"

class ReinforcementPricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reinforcement_prices_index_url
    assert_response :success
  end

  test "should get new" do
    get reinforcement_prices_new_url
    assert_response :success
  end
end
