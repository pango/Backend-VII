require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
  setup do
    @homepage = homepages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homepages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homepage" do
    assert_difference('Homepage.count') do
      post :create, homepage: @homepage.attributes
    end

    assert_redirected_to homepage_path(assigns(:homepage))
  end

  test "should show homepage" do
    get :show, id: @homepage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homepage.to_param
    assert_response :success
  end

  test "should update homepage" do
    put :update, id: @homepage.to_param, homepage: @homepage.attributes
    assert_redirected_to homepage_path(assigns(:homepage))
  end

  test "should destroy homepage" do
    assert_difference('Homepage.count', -1) do
      delete :destroy, id: @homepage.to_param
    end

    assert_redirected_to homepages_path
  end
end
