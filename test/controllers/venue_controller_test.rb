require 'test_helper'

class VenueControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get venue_new_url
    assert_response :success
  end

end
