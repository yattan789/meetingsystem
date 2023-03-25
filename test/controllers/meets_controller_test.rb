require "test_helper"

class MeetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meet = meets(:one)
  end

  test "should get index" do
    get meets_url
    assert_response :success
  end

  test "should get new" do
    get new_meet_url
    assert_response :success
  end

  test "should create meet" do
    assert_difference("Meet.count") do
      post meets_url, params: { meet: { date: @meet.date, description: @meet.description, title: @meet.title, user_id: @meet.user_id } }
    end

    assert_redirected_to meet_url(Meet.last)
  end

  test "should show meet" do
    get meet_url(@meet)
    assert_response :success
  end

  test "should get edit" do
    get edit_meet_url(@meet)
    assert_response :success
  end

  test "should update meet" do
    patch meet_url(@meet), params: { meet: { date: @meet.date, description: @meet.description, title: @meet.title, user_id: @meet.user_id } }
    assert_redirected_to meet_url(@meet)
  end

  test "should destroy meet" do
    assert_difference("Meet.count", -1) do
      delete meet_url(@meet)
    end

    assert_redirected_to meets_url
  end
end
