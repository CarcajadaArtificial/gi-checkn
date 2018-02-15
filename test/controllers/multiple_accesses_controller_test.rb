require 'test_helper'

class MultipleAccessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiple_access = multiple_accesses(:one)
  end

  test "should get index" do
    get multiple_accesses_url
    assert_response :success
  end

  test "should get new" do
    get new_multiple_access_url
    assert_response :success
  end

  test "should create multiple_access" do
    assert_difference('MultipleAccess.count') do
      post multiple_accesses_url, params: { multiple_access: { activity_type_id: @multiple_access.activity_type_id, amount: @multiple_access.amount, ticket_type_id: @multiple_access.ticket_type_id } }
    end

    assert_redirected_to multiple_access_url(MultipleAccess.last)
  end

  test "should show multiple_access" do
    get multiple_access_url(@multiple_access)
    assert_response :success
  end

  test "should get edit" do
    get edit_multiple_access_url(@multiple_access)
    assert_response :success
  end

  test "should update multiple_access" do
    patch multiple_access_url(@multiple_access), params: { multiple_access: { activity_type_id: @multiple_access.activity_type_id, amount: @multiple_access.amount, ticket_type_id: @multiple_access.ticket_type_id } }
    assert_redirected_to multiple_access_url(@multiple_access)
  end

  test "should destroy multiple_access" do
    assert_difference('MultipleAccess.count', -1) do
      delete multiple_access_url(@multiple_access)
    end

    assert_redirected_to multiple_accesses_url
  end
end
