require "test_helper"

class RawMaterialPricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get raw_material_prices_index_url
    assert_response :success
  end

  test "should get new" do
    get raw_material_prices_new_url
    assert_response :success
  end

  test "should get create" do
    get raw_material_prices_create_url
    assert_response :success
  end

  test "should get edit" do
    get raw_material_prices_edit_url
    assert_response :success
  end

  test "should get update" do
    get raw_material_prices_update_url
    assert_response :success
  end

  test "should get destroy" do
    get raw_material_prices_destroy_url
    assert_response :success
  end
end
