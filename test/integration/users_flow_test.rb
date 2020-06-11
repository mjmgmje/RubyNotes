require 'test_helper'

class UsersFlowTest < ActionDispatch::IntegrationTest
  
  test "can sign up" do
    post "/users",
      params: {user: {username: "username", password: "username"}}
      assert_redirected_to "/notes"
  end

end
