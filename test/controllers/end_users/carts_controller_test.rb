require 'test_helper'

class EndUsers::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_carts_index_url
    assert_response :success
  end

end
