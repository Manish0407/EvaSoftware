require "test_helper"

class UserTerritoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_territory_index_url
    assert_response :success
  end

  test "should get new" do
    get user_territory_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_territory_edit_url
    assert_response :success
  end
end
