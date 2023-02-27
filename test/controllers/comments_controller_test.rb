require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comments_index_url
    assert_response :success
  end

  test "should get show" do
    get comments_show_url
    assert_response :success
  end

  test "should get new" do
    get comments_new_url
    assert_response :success
  end

  test "should get create" do
    get comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get comments_destroy_url
    assert_response :success
  end

  test "should get set_post" do
    get comments_set_post_url
    assert_response :success
  end

  test "should get post_params" do
    get comments_post_params_url
    assert_response :success
  end
end
