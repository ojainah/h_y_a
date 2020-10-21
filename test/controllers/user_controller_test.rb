require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get precomplete" do
    get user_precomplete_url
    assert_response :success
  end

end
