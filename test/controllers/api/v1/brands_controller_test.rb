require "test_helper"

class Api::V1::BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_brands_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_brands_create_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_brands_edit_url
    assert_response :success
  end
end
