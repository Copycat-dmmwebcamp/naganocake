require 'test_helper'

class EndUsers::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_deliveries_index_url
    assert_response :success
  end

end
