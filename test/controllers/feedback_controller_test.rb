require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  test "should get message" do
    get feedback_message_url
    assert_response :success
  end

end
