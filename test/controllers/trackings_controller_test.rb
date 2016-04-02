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

  test "should end tracking" do
    @user.trackings.last.update(ended_at: nil)
    ApplicationController.any_instance.stubs(:current_user).returns @user
    post :end, id: @user.trackings.last.id
    assert @user.trackings.last.ended_at.present?
    assert_redirected_to '/trackings'
  end
end
