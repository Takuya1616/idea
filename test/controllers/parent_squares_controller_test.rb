require "test_helper"

class ParentSquaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parent_squares_index_url
    assert_response :success
  end

  test "should get show" do
    get parent_squares_show_url
    assert_response :success
  end

  test "should get create" do
    get parent_squares_create_url
    assert_response :success
  end

  test "should get update" do
    get parent_squares_update_url
    assert_response :success
  end

  test "should get destroy" do
    get parent_squares_destroy_url
    assert_response :success
  end
end
