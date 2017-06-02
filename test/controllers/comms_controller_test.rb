require 'test_helper'

class CommsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comm = comms(:one)
  end

  test "should get index" do
    get comms_url
    assert_response :success
  end

  test "should get new" do
    get new_comm_url
    assert_response :success
  end

  test "should create comm" do
    assert_difference('Comm.count') do
      post comms_url, params: { comm: { content: @comm.content, micropost_id: @comm.micropost_id, user_id: @comm.user_id } }
    end

    assert_redirected_to comm_url(Comm.last)
  end

  test "should show comm" do
    get comm_url(@comm)
    assert_response :success
  end

  test "should get edit" do
    get edit_comm_url(@comm)
    assert_response :success
  end

  test "should update comm" do
    patch comm_url(@comm), params: { comm: { content: @comm.content, micropost_id: @comm.micropost_id, user_id: @comm.user_id } }
    assert_redirected_to comm_url(@comm)
  end

  test "should destroy comm" do
    assert_difference('Comm.count', -1) do
      delete comm_url(@comm)
    end

    assert_redirected_to comms_url
  end
end
