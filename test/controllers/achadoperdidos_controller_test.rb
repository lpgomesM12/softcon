require 'test_helper'

class AchadoperdidosControllerTest < ActionController::TestCase
  setup do
    @achadoperdido = achadoperdidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:achadoperdidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create achadoperdido" do
    assert_difference('Achadoperdido.count') do
      post :create, achadoperdido: { data_achado: @achadoperdido.data_achado, data_entrega: @achadoperdido.data_entrega, descricao: @achadoperdido.descricao, morador_id: @achadoperdido.morador_id, observacao: @achadoperdido.observacao }
    end

    assert_redirected_to achadoperdido_path(assigns(:achadoperdido))
  end

  test "should show achadoperdido" do
    get :show, id: @achadoperdido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @achadoperdido
    assert_response :success
  end

  test "should update achadoperdido" do
    patch :update, id: @achadoperdido, achadoperdido: { data_achado: @achadoperdido.data_achado, data_entrega: @achadoperdido.data_entrega, descricao: @achadoperdido.descricao, morador_id: @achadoperdido.morador_id, observacao: @achadoperdido.observacao }
    assert_redirected_to achadoperdido_path(assigns(:achadoperdido))
  end

  test "should destroy achadoperdido" do
    assert_difference('Achadoperdido.count', -1) do
      delete :destroy, id: @achadoperdido
    end

    assert_redirected_to achadoperdidos_path
  end
end
