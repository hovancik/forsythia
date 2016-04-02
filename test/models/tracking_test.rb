require 'test_helper'

class TrackingTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
    @client = @user.clients.create(name: "Ehm", rate: 12)
    @tracking = @client.trackings.create(started_at: Time.now, user: @user)
  end

  test "should be valid" do
    assert @tracking.valid?
  end

  test "should belong to user" do
    assert_same @tracking.user_id, @user.id
  end

  test "should belong to client" do
    assert_same @tracking.client_id, @client.id
  end
end
