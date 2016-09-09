require 'test_helper'

class OcorrenciaControllerTest < ActionController::TestCase
  setup do
    @ocorrencium = ocorrencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ocorrencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ocorrencium" do
    assert_difference('Ocorrencium.count') do
      post :create, ocorrencium: { data_ocorrencia: @ocorrencium.data_ocorrencia, data_saida: @ocorrencium.data_saida, desc_ocorrencia: @ocorrencium.desc_ocorrencia, identificacao_id: @ocorrencium.identificacao_id, qdt_minutos: @ocorrencium.qdt_minutos }
    end

    assert_redirected_to ocorrencium_path(assigns(:ocorrencium))
  end

  test "should show ocorrencium" do
    get :show, id: @ocorrencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ocorrencium
    assert_response :success
  end

  test "should update ocorrencium" do
    patch :update, id: @ocorrencium, ocorrencium: { data_ocorrencia: @ocorrencium.data_ocorrencia, data_saida: @ocorrencium.data_saida, desc_ocorrencia: @ocorrencium.desc_ocorrencia, identificacao_id: @ocorrencium.identificacao_id, qdt_minutos: @ocorrencium.qdt_minutos }
    assert_redirected_to ocorrencium_path(assigns(:ocorrencium))
  end

  test "should destroy ocorrencium" do
    assert_difference('Ocorrencium.count', -1) do
      delete :destroy, id: @ocorrencium
    end

    assert_redirected_to ocorrencia_path
  end
end
