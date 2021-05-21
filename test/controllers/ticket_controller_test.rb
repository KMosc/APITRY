require "test_helper"

class TicketControllerTest < ActionDispatch::IntegrationTest
  test "should get buy" do
    get ticket_buy_url
    assert_response :success
  end

  test "should get reservation" do
    get ticket_reservation_url
    assert_response :success
  end
end
