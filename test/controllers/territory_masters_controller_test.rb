require "test_helper"

class TerritoryMastersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get territory_masters_index_url
    assert_response :success
  end

  test "should get new" do
    get territory_masters_new_url
    assert_response :success
  end

  test "should get edit" do
    get territory_masters_edit_url
    assert_response :success
  end
end
