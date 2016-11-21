require 'test_helper'

class MuralsControllerTest < ActionController::TestCase
  setup do
    @mural = murals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:murals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mural" do
    assert_difference('Mural.count') do
      post :create, mural: { condominio_id: @mural.condominio_id, descricao: @mural.descricao, titulo: @mural.titulo }
    end

    assert_redirected_to mural_path(assigns(:mural))
  end

  test "should show mural" do
    get :show, id: @mural
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mural
    assert_response :success
  end

  test "should update mural" do
    patch :update, id: @mural, mural: { condominio_id: @mural.condominio_id, descricao: @mural.descricao, titulo: @mural.titulo }
    assert_redirected_to mural_path(assigns(:mural))
  end

  test "should destroy mural" do
    assert_difference('Mural.count', -1) do
      delete :destroy, id: @mural
    end

    assert_redirected_to murals_path
  end
end
