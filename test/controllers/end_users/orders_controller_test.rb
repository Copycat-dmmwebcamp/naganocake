require 'test_helper'

class EndUsers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_orders_index_url
    assert_response :success
  end

end
