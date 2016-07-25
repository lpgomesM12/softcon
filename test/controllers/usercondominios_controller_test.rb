require 'test_helper'

class UsercondominiosControllerTest < ActionController::TestCase
  setup do
    @usercondominio = usercondominios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usercondominios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usercondominio" do
    assert_difference('Usercondominio.count') do
      post :create, usercondominio: { condominio_id: @usercondominio.condominio_id, funcao_id: @usercondominio.funcao_id, user_id: @usercondominio.user_id }
    end

    assert_redirected_to usercondominio_path(assigns(:usercondominio))
  end

  test "should show usercondominio" do
    get :show, id: @usercondominio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usercondominio
    assert_response :success
  end

  test "should update usercondominio" do
    patch :update, id: @usercondominio, usercondominio: { condominio_id: @usercondominio.condominio_id, funcao_id: @usercondominio.funcao_id, user_id: @usercondominio.user_id }
    assert_redirected_to usercondominio_path(assigns(:usercondominio))
  end

  test "should destroy usercondominio" do
    assert_difference('Usercondominio.count', -1) do
      delete :destroy, id: @usercondominio
    end

    assert_redirected_to usercondominios_path
  end
end
