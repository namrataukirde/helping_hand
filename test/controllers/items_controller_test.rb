require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get accept_item" do
    get items_accept_item_url
    assert_response :success
  end

end
