require 'test_helper'

class SingleAccessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @single_access = single_accesses(:one)
  end

  test "should get index" do
    get single_accesses_url
    assert_response :success
  end

  test "should get new" do
    get new_single_access_url
    assert_response :success
  end

  test "should create single_access" do
    assert_difference('SingleAccess.count') do
      post single_accesses_url, params: { single_access: { activity_id: @single_access.activity_id, ticket_type_id: @single_access.ticket_type_id } }
    end

    assert_redirected_to single_access_url(SingleAccess.last)
  end

  test "should show single_access" do
    get single_access_url(@single_access)
    assert_response :success
  end

  test "should get edit" do
    get edit_single_access_url(@single_access)
    assert_response :success
  end

  test "should update single_access" do
    patch single_access_url(@single_access), params: { single_access: { activity_id: @single_access.activity_id, ticket_type_id: @single_access.ticket_type_id } }
    assert_redirected_to single_access_url(@single_access)
  end

  test "should destroy single_access" do
    assert_difference('SingleAccess.count', -1) do
      delete single_access_url(@single_access)
    end

    assert_redirected_to single_accesses_url
  end
end
