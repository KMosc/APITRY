require "test_helper"

class TicketDesksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_desk = ticket_desks(:one)
  end

  test "should get index" do
    get ticket_desks_url, as: :json
    assert_response :success
  end

  test "should create ticket_desk" do
    assert_difference('TicketDesk.count') do
      post ticket_desks_url, params: { ticket_desk: { automated: @ticket_desk.automated, name: @ticket_desk.name } }, as: :json
    end

    assert_response 201
  end

  test "should show ticket_desk" do
    get ticket_desk_url(@ticket_desk), as: :json
    assert_response :success
  end

  test "should update ticket_desk" do
    patch ticket_desk_url(@ticket_desk), params: { ticket_desk: { automated: @ticket_desk.automated, name: @ticket_desk.name } }, as: :json
    assert_response 200
  end

  test "should destroy ticket_desk" do
    assert_difference('TicketDesk.count', -1) do
      delete ticket_desk_url(@ticket_desk), as: :json
    end

    assert_response 204
  end
end
