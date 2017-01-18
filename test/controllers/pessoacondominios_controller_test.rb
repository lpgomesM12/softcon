require 'test_helper'

class PessoacondominiosControllerTest < ActionController::TestCase
  setup do
    @pessoacondominio = pessoacondominios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pessoacondominios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pessoacondominio" do
    assert_difference('Pessoacondominio.count') do
      post :create, pessoacondominio: { condominio_id: @pessoacondominio.condominio_id, pessoa_id: @pessoacondominio.pessoa_id }
    end

    assert_redirected_to pessoacondominio_path(assigns(:pessoacondominio))
  end

  test "should show pessoacondominio" do
    get :show, id: @pessoacondominio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pessoacondominio
    assert_response :success
  end

  test "should update pessoacondominio" do
    patch :update, id: @pessoacondominio, pessoacondominio: { condominio_id: @pessoacondominio.condominio_id, pessoa_id: @pessoacondominio.pessoa_id }
    assert_redirected_to pessoacondominio_path(assigns(:pessoacondominio))
  end

  test "should destroy pessoacondominio" do
    assert_difference('Pessoacondominio.count', -1) do
      delete :destroy, id: @pessoacondominio
    end

    assert_redirected_to pessoacondominios_path
  end
end
