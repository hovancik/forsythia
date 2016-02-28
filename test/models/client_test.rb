require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
    @client = @user.clients.create(name: "Ehm", rate: 12)
  end

  test "should be valid" do
    assert @client.valid?
  end

  test "should belong to user" do
    assert_same @client.user_id, @user.id
  end

  test "name should be present" do
    @client.name = "     "
    assert_not @client.valid?
  end

  test "rate should be present" do
    @client.rate = "     "
    assert_not @client.valid?
  end
end
