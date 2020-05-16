require 'test_helper'

class Admins::OrderHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get update_order" do
    get admins_order_histories_update_order_url
    assert_response :success
  end

  test "should get update_product" do
    get admins_order_histories_update_product_url
    assert_response :success
  end

end
