require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get "/users/new"
    assert_response :success
  end

  test "should get create" do
    post "/users",
      params: {user: {username: "username", password: "username"}}
      assert_redirected_to "/notes"
  end

end
