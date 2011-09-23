require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu" do
    assert_difference('Menu.count') do
      post :create, :menu => { }
    end

    assert_redirected_to menu_path(assigns(:menu))
  end

  test "should show menu" do
    get :show, :id => menus(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => menus(:one).to_param
    assert_response :success
  end

  test "should update menu" do
    put :update, :id => menus(:one).to_param, :menu => { }
    assert_redirected_to menu_path(assigns(:menu))
  end

  test "should destroy menu" do
    assert_difference('Menu.count', -1) do
      delete :destroy, :id => menus(:one).to_param
    end

    assert_redirected_to menus_path
  end
end
