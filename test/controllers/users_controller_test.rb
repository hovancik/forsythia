require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create new user with incorrect data" do
    assert_no_difference 'User.count' do
      post :create, user: { name: "Jane",
                            email: "jane@example.com",
                            password: "foofoo",
                            password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "should create new user with correct data" do
    assert_difference 'User.count' do
      post :create, user: { name: "Jane",
                            email: "jane@example.com",
                            password: "barbarbar",
                            password_confirmation: "barbarbar" }
    end
    assert_redirected_to root_path
  end
end
