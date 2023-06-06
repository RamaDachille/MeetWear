require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comments_create_url
    assert_response :success
  end

  test "should get index" do
    get comments_index_url
    assert_response :success
  end

  test "should get new" do
    get comments_new_url
    assert_response :success
  end

  test "should get show" do
    get comments_show_url
    assert_response :success
  end
end
