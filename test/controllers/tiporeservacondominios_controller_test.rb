require 'test_helper'

class TiporeservacondominiosControllerTest < ActionController::TestCase
  setup do
    @tiporeservacondominio = tiporeservacondominios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiporeservacondominios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiporeservacondominio" do
    assert_difference('Tiporeservacondominio.count') do
      post :create, tiporeservacondominio: { condominio_id: @tiporeservacondominio.condominio_id, tiporeserva_id: @tiporeservacondominio.tiporeserva_id }
    end

    assert_redirected_to tiporeservacondominio_path(assigns(:tiporeservacondominio))
  end

  test "should show tiporeservacondominio" do
    get :show, id: @tiporeservacondominio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiporeservacondominio
    assert_response :success
  end

  test "should update tiporeservacondominio" do
    patch :update, id: @tiporeservacondominio, tiporeservacondominio: { condominio_id: @tiporeservacondominio.condominio_id, tiporeserva_id: @tiporeservacondominio.tiporeserva_id }
    assert_redirected_to tiporeservacondominio_path(assigns(:tiporeservacondominio))
  end

  test "should destroy tiporeservacondominio" do
    assert_difference('Tiporeservacondominio.count', -1) do
      delete :destroy, id: @tiporeservacondominio
    end

    assert_redirected_to tiporeservacondominios_path
  end
end
