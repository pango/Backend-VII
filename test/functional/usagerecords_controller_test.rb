require 'test_helper'

class UsagerecordsControllerTest < ActionController::TestCase
  setup do
    @usagerecord = usagerecords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usagerecords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usagerecord" do
    assert_difference('Usagerecord.count') do
      post :create, usagerecord: @usagerecord.attributes
    end

    assert_redirected_to usagerecord_path(assigns(:usagerecord))
  end

  test "should show usagerecord" do
    get :show, id: @usagerecord.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usagerecord.to_param
    assert_response :success
  end

  test "should update usagerecord" do
    put :update, id: @usagerecord.to_param, usagerecord: @usagerecord.attributes
    assert_redirected_to usagerecord_path(assigns(:usagerecord))
  end

  test "should destroy usagerecord" do
    assert_difference('Usagerecord.count', -1) do
      delete :destroy, id: @usagerecord.to_param
    end

    assert_redirected_to usagerecords_path
  end
end
