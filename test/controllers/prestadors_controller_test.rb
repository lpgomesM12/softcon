require 'test_helper'

class PrestadorsControllerTest < ActionController::TestCase
  setup do
    @prestador = prestadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prestadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prestador" do
    assert_difference('Prestador.count') do
      post :create, prestador: { categoriaprestador_id: @prestador.categoriaprestador_id, condominio_id: @prestador.condominio_id, desc_cpfcnpj: @prestador.desc_cpfcnpj, nome_prestador: @prestador.nome_prestador, nome_responsavel: @prestador.nome_responsavel, observacao: @prestador.observacao }
    end

    assert_redirected_to prestador_path(assigns(:prestador))
  end

  test "should show prestador" do
    get :show, id: @prestador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prestador
    assert_response :success
  end

  test "should update prestador" do
    patch :update, id: @prestador, prestador: { categoriaprestador_id: @prestador.categoriaprestador_id, condominio_id: @prestador.condominio_id, desc_cpfcnpj: @prestador.desc_cpfcnpj, nome_prestador: @prestador.nome_prestador, nome_responsavel: @prestador.nome_responsavel, observacao: @prestador.observacao }
    assert_redirected_to prestador_path(assigns(:prestador))
  end

  test "should destroy prestador" do
    assert_difference('Prestador.count', -1) do
      delete :destroy, id: @prestador
    end

    assert_redirected_to prestadors_path
  end
end
