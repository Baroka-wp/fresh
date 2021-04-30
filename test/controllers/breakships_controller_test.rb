require "test_helper"

class BreakshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get breakships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get breakships_destroy_url
    assert_response :success
  end
end
