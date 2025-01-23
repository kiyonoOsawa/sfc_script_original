require "application_system_test_case"

class FriendUsersTest < ApplicationSystemTestCase
  setup do
    @friend_user = friend_users(:one)
  end

  test "visiting the index" do
    visit friend_users_url
    assert_selector "h1", text: "Friend users"
  end

  test "should create friend user" do
    visit friend_users_url
    click_on "New friend user"

    fill_in "Friend", with: @friend_user.friend_id
    fill_in "User", with: @friend_user.user_id
    click_on "Create Friend user"

    assert_text "Friend user was successfully created"
    click_on "Back"
  end

  test "should update Friend user" do
    visit friend_user_url(@friend_user)
    click_on "Edit this friend user", match: :first

    fill_in "Friend", with: @friend_user.friend_id
    fill_in "User", with: @friend_user.user_id
    click_on "Update Friend user"

    assert_text "Friend user was successfully updated"
    click_on "Back"
  end

  test "should destroy Friend user" do
    visit friend_user_url(@friend_user)
    click_on "Destroy this friend user", match: :first

    assert_text "Friend user was successfully destroyed"
  end
end
