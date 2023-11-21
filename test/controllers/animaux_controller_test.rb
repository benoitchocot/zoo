require "test_helper"

class AnimauxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get animaux_index_url
    assert_response :success
  end
end
