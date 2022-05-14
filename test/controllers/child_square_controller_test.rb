require "test_helper"

class ChildSquareControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get child_square_show_url
    assert_response :success
  end

  test "should get create" do
    get child_square_create_url
    assert_response :success
  end

  test "should get update" do
    get child_square_update_url
    assert_response :success
  end
end
