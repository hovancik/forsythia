require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login with correct password" do
    User.any_instance.stubs(:authenticate).returns true
    post :create, session: {email: "john@example.com", password: "okokok"}
    assert_redirected_to root_path
  end

  test "should not login with bad password" do
    User.any_instance.stubs(:authenticate).returns false
    post :create, session: {email: "john@example.com", password: "notok"}
    assert_redirected_to '/login'
  end

  test "should get destroy" do
    delete :destroy
    assert_redirected_to root_path
  end
end
