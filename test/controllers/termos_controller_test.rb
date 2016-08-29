require 'test_helper'

class TermosControllerTest < ActionController::TestCase
  setup do
    @termo = termos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:termos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create termo" do
    assert_difference('Termo.count') do
      post :create, termo: { condominio_id: @termo.condominio_id, nome_termo: @termo.nome_termo, text_termo: @termo.text_termo, tipotermo_id: @termo.tipotermo_id }
    end

    assert_redirected_to termo_path(assigns(:termo))
  end

  test "should show termo" do
    get :show, id: @termo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @termo
    assert_response :success
  end

  test "should update termo" do
    patch :update, id: @termo, termo: { condominio_id: @termo.condominio_id, nome_termo: @termo.nome_termo, text_termo: @termo.text_termo, tipotermo_id: @termo.tipotermo_id }
    assert_redirected_to termo_path(assigns(:termo))
  end

  test "should destroy termo" do
    assert_difference('Termo.count', -1) do
      delete :destroy, id: @termo
    end

    assert_redirected_to termos_path
  end
end
