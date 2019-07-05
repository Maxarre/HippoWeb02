require 'test_helper'

class DoctersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get docters_show_url
    assert_response :success
  end

  test "should get dashboard" do
    get docters_dashboard_url
    assert_response :success
  end

  test "should get update" do
    get docters_update_url
    assert_response :success
  end

end
