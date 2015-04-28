require 'test_helper'

class ChatControllerTest < ActionController::TestCase
  test "should get start_conversation" do
    get :start_conversation
    assert_response :success
  end

end
