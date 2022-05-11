require "test_helper"

class SquaresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get squares_new_url
    assert_response :success
  end

  test "should get index" do
    get squares_index_url
    assert_response :success
  end

  test "should get create" do
    get squares_create_url
    assert_response :success
  end

  test "should get edit" do
    get squares_edit_url
    assert_response :success
  end

  test "should get update" do
    get squares_update_url
    assert_response :success
  end

  test "should get destroy" do
    get squares_destroy_url
    assert_response :success
  end
end
