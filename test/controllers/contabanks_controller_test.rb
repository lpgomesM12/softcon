require 'test_helper'

class ContabanksControllerTest < ActionController::TestCase
  setup do
    @contabank = contabanks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contabanks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contabank" do
    assert_difference('Contabank.count') do
      post :create, contabank: { condominio_id: @contabank.condominio_id, nome_banco: @contabank.nome_banco, nome_conta: @contabank.nome_conta, numr_agencia: @contabank.numr_agencia, situacao: @contabank.situacao }
    end

    assert_redirected_to contabank_path(assigns(:contabank))
  end

  test "should show contabank" do
    get :show, id: @contabank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contabank
    assert_response :success
  end

  test "should update contabank" do
    patch :update, id: @contabank, contabank: { condominio_id: @contabank.condominio_id, nome_banco: @contabank.nome_banco, nome_conta: @contabank.nome_conta, numr_agencia: @contabank.numr_agencia, situacao: @contabank.situacao }
    assert_redirected_to contabank_path(assigns(:contabank))
  end

  test "should destroy contabank" do
    assert_difference('Contabank.count', -1) do
      delete :destroy, id: @contabank
    end

    assert_redirected_to contabanks_path
  end
end
