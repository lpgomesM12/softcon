require 'test_helper'

class CategoriaprestadorsControllerTest < ActionController::TestCase
  setup do
    @categoriaprestador = categoriaprestadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoriaprestadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoriaprestador" do
    assert_difference('Categoriaprestador.count') do
      post :create, categoriaprestador: { nome_categoria: @categoriaprestador.nome_categoria }
    end

    assert_redirected_to categoriaprestador_path(assigns(:categoriaprestador))
  end

  test "should show categoriaprestador" do
    get :show, id: @categoriaprestador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoriaprestador
    assert_response :success
  end

  test "should update categoriaprestador" do
    patch :update, id: @categoriaprestador, categoriaprestador: { nome_categoria: @categoriaprestador.nome_categoria }
    assert_redirected_to categoriaprestador_path(assigns(:categoriaprestador))
  end

  test "should destroy categoriaprestador" do
    assert_difference('Categoriaprestador.count', -1) do
      delete :destroy, id: @categoriaprestador
    end

    assert_redirected_to categoriaprestadors_path
  end
end
