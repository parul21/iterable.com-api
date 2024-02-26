require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get events_index_url
    assert_response :success
  end

  test "should get create_event_a" do
    get events_create_event_a_url
    assert_response :success
  end

  test "should get create_event_b" do
    get events_create_event_b_url
    assert_response :success
  end
end
