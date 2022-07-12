require "test_helper"

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_create_url
    assert_response :success
  end
end
