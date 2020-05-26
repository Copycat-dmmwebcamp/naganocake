require 'test_helper'

class EndUser::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get leave" do
    get end_user_users_leave_url
    assert_response :success
  end

end
