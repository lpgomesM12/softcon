require 'test_helper'

class IdentificacaosControllerTest < ActionController::TestCase
  setup do
    @identificacao = identificacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identificacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create identificacao" do
    assert_difference('Identificacao.count') do
      post :create, identificacao: { apartamento_id: @identificacao.apartamento_id, desc_atividade: @identificacao.desc_atividade, desc_fone: @identificacao.desc_fone, desc_identificador: @identificacao.desc_identificador, desc_nome: @identificacao.desc_nome }
    end

    assert_redirected_to identificacao_path(assigns(:identificacao))
  end

  test "should show identificacao" do
    get :show, id: @identificacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @identificacao
    assert_response :success
  end

  test "should update identificacao" do
    patch :update, id: @identificacao, identificacao: { apartamento_id: @identificacao.apartamento_id, desc_atividade: @identificacao.desc_atividade, desc_fone: @identificacao.desc_fone, desc_identificador: @identificacao.desc_identificador, desc_nome: @identificacao.desc_nome }
    assert_redirected_to identificacao_path(assigns(:identificacao))
  end

  test "should destroy identificacao" do
    assert_difference('Identificacao.count', -1) do
      delete :destroy, id: @identificacao
    end

    assert_redirected_to identificacaos_path
  end
end
