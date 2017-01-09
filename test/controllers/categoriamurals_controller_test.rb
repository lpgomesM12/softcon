require 'test_helper'

class CategoriamuralsControllerTest < ActionController::TestCase
  setup do
    @categoriamural = categoriamurals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoriamurals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoriamural" do
    assert_difference('Categoriamural.count') do
      post :create, categoriamural: { condiminio_id: @categoriamural.condiminio_id, nome_categoria: @categoriamural.nome_categoria }
    end

    assert_redirected_to categoriamural_path(assigns(:categoriamural))
  end

  test "should show categoriamural" do
    get :show, id: @categoriamural
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoriamural
    assert_response :success
  end

  test "should update categoriamural" do
    patch :update, id: @categoriamural, categoriamural: { condiminio_id: @categoriamural.condiminio_id, nome_categoria: @categoriamural.nome_categoria }
    assert_redirected_to categoriamural_path(assigns(:categoriamural))
  end

  test "should destroy categoriamural" do
    assert_difference('Categoriamural.count', -1) do
      delete :destroy, id: @categoriamural
    end

    assert_redirected_to categoriamurals_path
  end
end
