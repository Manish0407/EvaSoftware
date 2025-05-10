require "test_helper"

class TerritoryLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get territory_locations_index_url
    assert_response :success
  end

  test "should get new" do
    get territory_locations_new_url
    assert_response :success
  end

  test "should get edit" do
    get territory_locations_edit_url
    assert_response :success
  end
end
