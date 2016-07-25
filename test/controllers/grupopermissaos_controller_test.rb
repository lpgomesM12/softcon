require 'test_helper'

class GrupopermissaosControllerTest < ActionController::TestCase
  setup do
    @grupopermissao = grupopermissaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupopermissaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupopermissao" do
    assert_difference('Grupopermissao.count') do
      post :create, grupopermissao: { nome: @grupopermissao.nome }
    end

    assert_redirected_to grupopermissao_path(assigns(:grupopermissao))
  end

  test "should show grupopermissao" do
    get :show, id: @grupopermissao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupopermissao
    assert_response :success
  end

  test "should update grupopermissao" do
    patch :update, id: @grupopermissao, grupopermissao: { nome: @grupopermissao.nome }
    assert_redirected_to grupopermissao_path(assigns(:grupopermissao))
  end

  test "should destroy grupopermissao" do
    assert_difference('Grupopermissao.count', -1) do
      delete :destroy, id: @grupopermissao
    end

    assert_redirected_to grupopermissaos_path
  end
end
