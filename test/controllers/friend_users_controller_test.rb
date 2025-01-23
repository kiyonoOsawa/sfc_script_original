require "test_helper"

class FriendUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_user = friend_users(:one)
  end

  test "should get index" do
    get friend_users_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_user_url
    assert_response :success
  end

  test "should create friend_user" do
    assert_difference("FriendUser.count") do
      post friend_users_url, params: { friend_user: { friend_id: @friend_user.friend_id, user_id: @friend_user.user_id } }
    end

    assert_redirected_to friend_user_url(FriendUser.last)
  end

  test "should show friend_user" do
    get friend_user_url(@friend_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_user_url(@friend_user)
    assert_response :success
  end

  test "should update friend_user" do
    patch friend_user_url(@friend_user), params: { friend_user: { friend_id: @friend_user.friend_id, user_id: @friend_user.user_id } }
    assert_redirected_to friend_user_url(@friend_user)
  end

  test "should destroy friend_user" do
    assert_difference("FriendUser.count", -1) do
      delete friend_user_url(@friend_user)
    end

    assert_redirected_to friend_users_url
  end
end
