require 'test_helper'

class MoradorsControllerTest < ActionController::TestCase
  setup do
    @morador = moradors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moradors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create morador" do
    assert_difference('Morador.count') do
      post :create, morador: { apartamento_id: @morador.apartamento_id, pessoa_id: @morador.pessoa_id }
    end

    assert_redirected_to morador_path(assigns(:morador))
  end

  test "should show morador" do
    get :show, id: @morador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @morador
    assert_response :success
  end

  test "should update morador" do
    patch :update, id: @morador, morador: { apartamento_id: @morador.apartamento_id, pessoa_id: @morador.pessoa_id }
    assert_redirected_to morador_path(assigns(:morador))
  end

  test "should destroy morador" do
    assert_difference('Morador.count', -1) do
      delete :destroy, id: @morador
    end

    assert_redirected_to moradors_path
  end
end
