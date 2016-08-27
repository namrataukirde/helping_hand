require 'test_helper'

class NgosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ngos_show_url
    assert_response :success
  end

end
