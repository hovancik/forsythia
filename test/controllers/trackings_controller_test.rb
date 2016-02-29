require 'test_helper'

class TrackingsControllerTest < ActionController::TestCase
  def setup
    @user = users(:john)
  end

  test "should get new for logged user" do
    ApplicationController.any_instance.stubs(:current_user).returns @user
    get :new
    assert_response :success
  end

  test "should redirect update when not logged in" do
    ApplicationController.any_instance.stubs(:current_user).returns nil
    get :new
    assert_redirected_to '/login'
  end

  test "should create new tracking" do
    ApplicationController.any_instance.stubs(:current_user).returns @user
    assert_difference 'Tracking.count' do
      post :create, tracking: {started_at: Time.now, client_id: @user.clients.first.id}
    end
    assert_redirected_to root_path
  end
end
