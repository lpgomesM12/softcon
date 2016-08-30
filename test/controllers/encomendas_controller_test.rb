require 'test_helper'

class EncomendasControllerTest < ActionController::TestCase
  setup do
    @encomenda = encomendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encomendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encomenda" do
    assert_difference('Encomenda.count') do
      post :create, encomenda: { condominio_id: @encomenda.condominio_id, data_encomenda: @encomenda.data_encomenda, data_entrega: @encomenda.data_entrega, morador_id: @encomenda.morador_id, msg_encomenda: @encomenda.msg_encomenda }
    end

    assert_redirected_to encomenda_path(assigns(:encomenda))
  end

  test "should show encomenda" do
    get :show, id: @encomenda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encomenda
    assert_response :success
  end

  test "should update encomenda" do
    patch :update, id: @encomenda, encomenda: { condominio_id: @encomenda.condominio_id, data_encomenda: @encomenda.data_encomenda, data_entrega: @encomenda.data_entrega, morador_id: @encomenda.morador_id, msg_encomenda: @encomenda.msg_encomenda }
    assert_redirected_to encomenda_path(assigns(:encomenda))
  end

  test "should destroy encomenda" do
    assert_difference('Encomenda.count', -1) do
      delete :destroy, id: @encomenda
    end

    assert_redirected_to encomendas_path
  end
end
