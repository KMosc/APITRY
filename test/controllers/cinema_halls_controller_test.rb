require "test_helper"

class CinemaHallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cinema_hall = cinema_halls(:one)
  end

  test "should get index" do
    get cinema_halls_url, as: :json
    assert_response :success
  end

  test "should create cinema_hall" do
    assert_difference('CinemaHall.count') do
      post cinema_halls_url, params: { cinema_hall: { volume: @cinema_hall.volume } }, as: :json
    end

    assert_response 201
  end

  test "should show cinema_hall" do
    get cinema_hall_url(@cinema_hall), as: :json
    assert_response :success
  end

  test "should update cinema_hall" do
    patch cinema_hall_url(@cinema_hall), params: { cinema_hall: { volume: @cinema_hall.volume } }, as: :json
    assert_response 200
  end

  test "should destroy cinema_hall" do
    assert_difference('CinemaHall.count', -1) do
      delete cinema_hall_url(@cinema_hall), as: :json
    end

    assert_response 204
  end
end
