require 'test_helper'

class EndUser::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get end_user_orders_confirm_url
    assert_response :success
  end

  test "should get history" do
    get end_user_orders_history_url
    assert_response :success
  end

  test "should get history_show" do
    get end_user_orders_history_show_url
    assert_response :success
  end

end
