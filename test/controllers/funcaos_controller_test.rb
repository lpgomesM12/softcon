require 'test_helper'

class FuncaosControllerTest < ActionController::TestCase
  setup do
    @funcao = funcaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcao" do
    assert_difference('Funcao.count') do
      post :create, funcao: { desc_funcao: @funcao.desc_funcao }
    end

    assert_redirected_to funcao_path(assigns(:funcao))
  end

  test "should show funcao" do
    get :show, id: @funcao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcao
    assert_response :success
  end

  test "should update funcao" do
    patch :update, id: @funcao, funcao: { desc_funcao: @funcao.desc_funcao }
    assert_redirected_to funcao_path(assigns(:funcao))
  end

  test "should destroy funcao" do
    assert_difference('Funcao.count', -1) do
      delete :destroy, id: @funcao
    end

    assert_redirected_to funcaos_path
  end
end
