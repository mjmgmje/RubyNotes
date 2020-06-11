require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    post "/users",
      params: {user: {username: "username", password: "username"}}
      assert_redirected_to "/notes"
    get notes_index_url
    assert_response :success
  end

end
