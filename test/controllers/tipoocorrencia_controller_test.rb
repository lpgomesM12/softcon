require 'test_helper'

class TipoocorrenciaControllerTest < ActionController::TestCase
  setup do
    @tipoocorrencium = tipoocorrencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipoocorrencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipoocorrencium" do
    assert_difference('Tipoocorrencium.count') do
      post :create, tipoocorrencium: { desc_tipoocorrencia: @tipoocorrencium.desc_tipoocorrencia }
    end

    assert_redirected_to tipoocorrencium_path(assigns(:tipoocorrencium))
  end

  test "should show tipoocorrencium" do
    get :show, id: @tipoocorrencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipoocorrencium
    assert_response :success
  end

  test "should update tipoocorrencium" do
    patch :update, id: @tipoocorrencium, tipoocorrencium: { desc_tipoocorrencia: @tipoocorrencium.desc_tipoocorrencia }
    assert_redirected_to tipoocorrencium_path(assigns(:tipoocorrencium))
  end

  test "should destroy tipoocorrencium" do
    assert_difference('Tipoocorrencium.count', -1) do
      delete :destroy, id: @tipoocorrencium
    end

    assert_redirected_to tipoocorrencia_path
  end
end
