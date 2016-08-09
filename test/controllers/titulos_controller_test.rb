require 'test_helper'

class TitulosControllerTest < ActionController::TestCase
  setup do
    @titulo = titulos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:titulos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create titulo" do
    assert_difference('Titulo.count') do
      post :create, titulo: { data_cancelamento: @titulo.data_cancelamento, desc_titulo: @titulo.desc_titulo, numr_tipolancamento: @titulo.numr_tipolancamento }
    end

    assert_redirected_to titulo_path(assigns(:titulo))
  end

  test "should show titulo" do
    get :show, id: @titulo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @titulo
    assert_response :success
  end

  test "should update titulo" do
    patch :update, id: @titulo, titulo: { data_cancelamento: @titulo.data_cancelamento, desc_titulo: @titulo.desc_titulo, numr_tipolancamento: @titulo.numr_tipolancamento }
    assert_redirected_to titulo_path(assigns(:titulo))
  end

  test "should destroy titulo" do
    assert_difference('Titulo.count', -1) do
      delete :destroy, id: @titulo
    end

    assert_redirected_to titulos_path
  end
end
