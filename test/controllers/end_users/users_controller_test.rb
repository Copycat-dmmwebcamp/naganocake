require 'test_helper'

class EndUsers::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_users_index_url
    assert_response :success
  end

end
