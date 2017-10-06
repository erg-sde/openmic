require 'test_helper'

class UserEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_events_new_url
    assert_response :success
  end

end
