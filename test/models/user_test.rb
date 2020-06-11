require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user without username" do
    user = User.new
    user[:password_digest] = "nuevaPass"
    user[:user_role] = "teamMember"
    assert_not user.save, "Saved User without username"
  end

  test "should not save user without password" do
    user = User.new    
    user[:username] = "username"
    user[:user_role] = "teamMember"
    assert_not user.save, "Saved User without username"
  end

  test "should not save user without user_role" do
    user = User.new
    user[:username] = "username"
    user[:password_digest] = "nuevaPass"
    assert_not user.save, "Saved User without user_role"
  end

  test "should not save user with invalid user_role" do
    user = User.new
    user[:username] = "username"
    user[:password_digest] = "nuevaPass"
    user[:user_role] = "associated"
    assert_not user.save, "Saved User with invalid user_role"
  end

end
