require 'test_helper'

class ZRoundsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get z_rounds_edit_url
    assert_response :success
  end

end
