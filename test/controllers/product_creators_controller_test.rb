require "test_helper"

class ProductCreatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_creators_index_url
    assert_response :success
  end

  test "should get show" do
    get product_creators_show_url
    assert_response :success
  end
end
