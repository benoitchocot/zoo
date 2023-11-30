require "test_helper"

class VisiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get visite_index_url
    assert_response :success
  end
end
